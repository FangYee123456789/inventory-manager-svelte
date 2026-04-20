import { Button, InputAdornment, Stack, TextField } from "@mui/material";
import { SessionContext } from "lib/context/context";
import { getBalance } from "lib/database/balance-api";
import { insertBulkBalanceTransactions } from "lib/database/balance-transactions-api";
import Mexp from "math-expression-evaluator";
import { useContext, useEffect, useState } from "react";
import type { balanceTransaction } from "types/supabase";

export default function BalanceManager() {
  const [balance, setBalance] = useState("");
  const [initialBalance, setInitialBalance] = useState("");
  const [balanceChanges, setBalanceChanges] = useState<balanceTransaction[]>([]);
  const session = useContext(SessionContext);

  useEffect(() => {
    async function fetchBalance() {
      const { balance } = await getBalance();
      const fixedBalance = balance.toFixed(2);
      setBalance(fixedBalance);
      setInitialBalance(fixedBalance);
    }
    fetchBalance();
  }, []);

  function handleBalanceChange(e: React.ChangeEvent<HTMLInputElement>) {
    setBalance(e.target.value);
  }

  function handleBalanceFormSubmit(e: React.SubmitEvent<HTMLFormElement>) {
    e.preventDefault();
    if (!session) return;
    const mexp = new Mexp();
    let result;
    try {
      result = mexp.eval(balance).toFixed(2);
    } catch (e) {
      console.error(e);
      console.log("error hit");
      return;
    }

    setBalance(result);

    const newTransaction: balanceTransaction = {
      projectID: "1",
      balanceChange: Number(result),
      createdAt: new Date(),
      loggerID: session.user.id,
    };
    setBalanceChanges([...balanceChanges, newTransaction]);
  }

  function handleCancel() {
    setBalance(initialBalance);
  }

  async function handleConfirm() {
    await insertBulkBalanceTransactions(balanceChanges);
    // await updateProjectBalance(balance);
    window.location.reload();
  }

  return (
    <Stack direction="row" spacing={2}>
      <form onSubmit={handleBalanceFormSubmit}>
        <TextField
          placeholder={initialBalance}
          variant="standard"
          label="Balance"
          value={balance}
          onChange={handleBalanceChange}
          slotProps={{
            input: {
              startAdornment: <InputAdornment position="start">$</InputAdornment>,
            },
          }}
        />
      </form>
      <Button variant="outlined" onClick={handleCancel}>
        Cancel
      </Button>
      <Button variant="contained" onClick={handleConfirm}>
        Confirm
      </Button>
    </Stack>
  );
}
