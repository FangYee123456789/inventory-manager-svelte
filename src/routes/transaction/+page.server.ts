import { getIncomingTransactions, getOutgoingTransactions } from '$lib/remote/transaction.remote';
import type { CompleteTransaction } from '$lib/types/databaseTypes';

export async function load() {
	const incomingTransactions = await getIncomingTransactions();
	if (!incomingTransactions) throw new Error('getIncomingTransactions returned undefined');
	const outgoingTransactions = await getOutgoingTransactions();
	if (!outgoingTransactions) throw new Error('getOutgoingTransactions returned undefined');

	return {
		transactions: sortByDate([...incomingTransactions, ...outgoingTransactions])
	};
}

function sortByDate(transactions: CompleteTransaction[]) {
	return transactions.toSorted((a, b) => b.createdAt.getTime() - a.createdAt.getTime());
}
