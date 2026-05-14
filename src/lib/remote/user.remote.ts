import { form } from '$app/server';
import { handleQueryErrors, sql } from '$lib/server/postgres';
import { email, password } from '$lib/types/schemaTypes';
import { hashPassword } from '$lib/utils/hash';
import z from 'zod';

export const createUser = form(z.object({ email, password }), async ({ email, password }) => {
	try {
		const passwordHash = await hashPassword(password);
		const result = await sql`INSERT INTO users (email, password) VALUES(${email}, ${passwordHash})`;
		if (result.count !== 1) throw new Error('Failed to create user');
	} catch (e) {
		handleQueryErrors(e);
	}
});
