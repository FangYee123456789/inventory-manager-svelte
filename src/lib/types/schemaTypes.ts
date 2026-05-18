import * as z from 'zod';

export const zString = z.string().trim();
export const zNumber = z
	.number()
	.int('Number be an integer.')
	.gte(0, 'Number must not be negative.');
export const zImgFile = z
	.file('Please submit a file.')
	.mime(
		['image/gif', 'image/jpeg', 'image/png', 'image/svg+xml', 'image/webp'],
		'Unsupported file format.'
	); //why don't they have a wildcard bruh

export const serial = z.coerce
	.number()
	.int()
	.gt(0)
	.transform((val) => String(val));
export const email = z.email().trim().toLowerCase();
export const password = z.string().trim().min(8, 'Min. 8 characters');

export const masterNumber = z
	.string()
	.regex(/^\d/, 'Master Number should start with a number.')
	.toLowerCase()
	.trim();
