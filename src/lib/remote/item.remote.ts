import { query } from '$app/server';
import type { Item } from '$lib/types/databaseTypes';
import { handleQueryErrors } from '$lib/utils/errorHandling';

export const getItems = query(async () => {
	try {
		await new Promise((resolve) => setTimeout(resolve, 5000));
		return items;
	} catch (e) {
		handleQueryErrors(e);
	}
});

