import { command, query } from '$app/server';
import { sql } from '$lib/server/postgres';
import type { Category, Supplier } from '$lib/types/databaseTypes';
import { zString } from '$lib/types/schemaTypes';
import { handleQueryErrors } from '$lib/utils/errorHandling';

export const getSuppliers = query(async () => {
	try {
		return await sql<Supplier[]>`SELECT * FROM suppliers`;
	} catch (e) {
		handleQueryErrors(e);
	}
});

export const getOrCreateSupplier = command(zString, async (name) => {
	try {
		const [result] = await sql<Category[]>`
			WITH i AS(
				INSERT INTO categories (name) VALUES (${name}) 
				ON CONFLICT(name) DO NOTHING
				RETURNING id
			)
			SELECT id FROM i
			UNION ALL
			SELECT id FROM categories WHERE name = ${name}
			LIMIT 1;`;
		return result;
	} catch (e) {
		handleQueryErrors(e);
	}
});
