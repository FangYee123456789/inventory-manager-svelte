import { utils, writeFile } from 'xlsx';

export function tableToCSV(table: Element, fileName: string) {
	const workbook = utils.book_new();
	const worksheet = utils.table_to_sheet(table, { raw: true });

	const range = utils.decode_range(worksheet['!ref'] || 'A1:A1');
	const totalCols = range.e.c - range.s.c + 1;
	const totalRows = range.e.r - range.s.r + 1;

	worksheet['!cols'] = Array(totalCols).fill({ wpx: 150 });

	worksheet['!rows'] = Array(totalRows).fill({ hpx: 40 });

	utils.book_append_sheet(workbook, worksheet, 'Table 1');
	writeFile(workbook, `${fileName}.xlsx`);
}
