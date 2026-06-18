<script lang="ts">
	import type { CompleteTransaction } from '$lib/types/databaseTypes';
	import TransactionAccordion from './transactionAccordion.svelte';

	type Props = {
		transactions: CompleteTransaction[];
	};

	const { transactions }: Props = $props();
</script>

{#each transactions as transaction, i (i)}
	<TransactionAccordion {transaction} />
{/each}
