import { getOutgoingTransactions } from '$lib/remote/transaction.remote';
import { error } from '@sveltejs/kit';

export async function load({ locals }) {
	if (!(locals.user?.role === 'Admin' || locals.user?.role === 'Project')) error(403, 'Forbidden');

	const transactions = await getOutgoingTransactions();
	if (!transactions) throw new Error('getOutgoingTransactions returned undefined');
	return {
		transactions
	};
}
