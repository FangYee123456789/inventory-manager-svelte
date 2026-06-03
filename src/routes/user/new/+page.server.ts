import { error } from '@sveltejs/kit';

export function load({ locals }) {
	if (!locals.user || locals.user.role !== 'Admin') error(403, 'Forbidden');
}
