export function localeCompareSort(a: string, b: string) {
	return a.localeCompare(b, 'en', { sensitivity: 'base', numeric: true });
}
