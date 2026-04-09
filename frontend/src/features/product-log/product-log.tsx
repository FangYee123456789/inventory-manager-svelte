import { useState, useEffect } from "react";
import LogCard from "./components/log-card";
import type { transaction } from "types/supabase";
import { getAllTransactions } from "./lib/supabase-calls";

function ProductLog() {
    const [transactions, setTransactions] = useState<transaction[]>([]);

    useEffect(() => {
        async function fetchTransactions() {
            const transactions = await getAllTransactions();
            setTransactions(transactions);
        }
        fetchTransactions();
    }, []);

    return (
        <section className="column">
            {transactions.map((transaction) => (
                <LogCard transaction={transaction} key={transaction.id} />
            ))}
        </section>
    );
}

export default ProductLog;
