import { form } from '$app/server';
import { zString } from '$lib/types/schemaTypes';
import * as z from 'zod';

export const createTransaction = form(
	z.object({ date: z.iso.date(), supplier: zString, id: zString, items: z.array(zString) }),
	async ({ date, supplier, id, items }) => {
		console.log(date, supplier, id, items);
	}
);
