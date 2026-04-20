import { supabase } from "lib/database/supabase";
import type { balanceTransaction } from "types/supabase";

export async function insertBulkBalanceTransactions(transactions: balanceTransaction[]) {
  const { error } = await supabase.from("balance_transactions").insert([...transactions]);
  if (error) {
    console.error("Error inserting balance transactions: ", error);
  }
}
