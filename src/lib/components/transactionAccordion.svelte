<script lang="ts">
	import { deleteTransaction } from '$lib/remote/transaction.remote';
	import type { CompleteTransaction } from '$lib/types/databaseTypes';
	import { localeCompareSort } from '$lib/utils/arraySort';
	import { formatRelativeCustom, formatYearMonthDay } from '$lib/utils/dateFns';
	import Accordion from './base/accordion.svelte';

	type Props = {
		transaction: CompleteTransaction;
		isIncoming: boolean;
		elementID: string;
	};

	const { transaction, isIncoming, elementID }: Props = $props();
	const {
		id,
		createdAt,
		deliveryDate,
		supplier,
		deliveryRef,
		purchaseRef,
		invoiceRef,
		expendDate,
		expender,
		remarks,
		items
	} = $derived(transaction);

	const sortedItems = $derived.by(() =>
		items.sort((a, b) => localeCompareSort(a.master, b.master))
	);

	const uniqueForm = $derived(deleteTransaction.for(elementID));
</script>

<Accordion
	{elementID}
	{summaryStart}
	{summaryEnd}
	{content}
	deleteForm={uniqueForm}
	deletePrompt="Are you sure you want to delete this transaction?"
	deleteSuccess="Transaction has been deleted."
	deleteFail="Failed to delete transaction."
	{deleteFormChildren}>
</Accordion>

{#snippet summaryStart()}
	{#if isIncoming}
		<span>
			{supplier}
			{formatYearMonthDay(deliveryDate!)}
			{deliveryRef}
		</span>
	{:else}
		<span>
			{expender}
			{formatYearMonthDay(expendDate!)}
			{remarks}
		</span>
	{/if}
{/snippet}

{#snippet summaryEnd()}
	{#if expendDate}
		<span class="text-center text-2xl text-red-500">OUTGOING</span>
	{:else}
		<span class="text-center text-2xl text-green-500">INCOMING</span>
	{/if}
	<span class="mr-5 ml-5">{formatRelativeCustom(createdAt)}</span>
{/snippet}

{#snippet content()}
	<div class="divider"></div>
	{#if purchaseRef}
		<div>PO: {purchaseRef}</div>
	{/if}
	{#if invoiceRef}
		<div>Invoice: {invoiceRef}</div>
	{/if}
	<ul class="mt-2">
		{#each sortedItems as item, i (i)}
			<li class="mb-2 list-none">
				<pre class="inline">#{item.master.padEnd(5, ' ')}</pre>
				<pre class="inline">{isIncoming ? '+' : '-'}{String(item.quantity).padEnd(5, ' ')}</pre>
				<span>{item.name}</span>
			</li>
		{/each}
	</ul>
{/snippet}

{#snippet deleteFormChildren()}
	<input {...uniqueForm.fields.id.as('hidden', id)} />
	<input {...uniqueForm.fields.isIncoming.as('checkbox', isIncoming)} class="invisible" />
	<button class="btn btn-primary">Confirm</button>
{/snippet}
