import { List, Stack } from "@mui/material";
import { getDeliveryOrderByID } from "lib/database/delivery-order-api";
import { getAllTransactions } from "lib/database/transactions-api";
import { useEffect, useState } from "react";
import type { deliveryOrder, transaction } from "types/supabase";
import TransactionCardModal from "./components/transaction-card-modal";
import TransactionMessage from "./components/transaction-message";

function TransactionLog() {
  const [isModalOpen, setModalOpen] = useState(false);
  const [selectedTransaction, setSelectedTransaction] = useState<transaction>();
  const [selectedTransactionDeliveryOrder, setSelectedTransactionDeliveryOrder] =
    useState<deliveryOrder>();

  async function handleSelectTransaction(transaction: transaction) {
    setSelectedTransaction(transaction);
    setSelectedTransactionDeliveryOrder(undefined);
    if (transaction.deliveryID) {
      const selectedDeliverOrder = await getDeliveryOrderByID(transaction.deliveryID);
      setSelectedTransactionDeliveryOrder(selectedDeliverOrder[0]);
    }
  }

  function openModal() {
    setModalOpen(true);
  }

  function closeModal() {
    setModalOpen(false);
  }

  const [transactions, setTransactions] = useState<transaction[]>([]);

  useEffect(() => {
    async function fetchTransactions() {
      const transactions = await getAllTransactions();
      setTransactions(transactions);
    }
    fetchTransactions();
  }, []);

  return (
    <>
      <List>
        <Stack>
          {transactions.map((transaction) => (
            <TransactionMessage
              transaction={transaction}
              key={transaction.id}
              handleOpenModal={openModal}
              selectTransaction={handleSelectTransaction}
            />
          ))}
        </Stack>
      </List>

      {selectedTransaction && (
        <TransactionCardModal
          isModalOpen={isModalOpen}
          handleCloseModal={closeModal}
          transactionData={selectedTransaction}
          deliveryOrderData={selectedTransactionDeliveryOrder}
        />
      )}
    </>
  );
}

export default TransactionLog;
