import { getAllTransactions } from '$lib/remote/transaction.remote';

export async function load() {
	const transactions = await getAllTransactions();
	if (!transactions) throw new Error('getAllTransactions returned undefined');

	return {
		transactions
	};
}
