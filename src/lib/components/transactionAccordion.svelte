<script lang="ts">
	import type { CompleteIncomingTransaction } from '$lib/types/databaseTypes';
	import { formatRelative } from 'date-fns';

	type Props = {
		transactions: CompleteIncomingTransaction[];
	};

	const { transactions }: Props = $props();
</script>

{#each transactions as { id, createdAt, supplier, deliveryID, items } (id)}
	<details class="collapse border border-base-300 bg-base-100" name="my-accordion-det-1">
		<summary class="collapse-title font-semibold">
			<div class="flex items-center justify-between">
				<span>{supplier}, {deliveryID} </span>
				<span>
					{formatRelative(createdAt, new Date())}
					<button class="btn ms-2 btn-soft btn-accent" aria-label="focus">
						<span class="icon-[ion--navigate]"></span>
					</button>
				</span>
			</div>
		</summary>
		<div class="collapse-content text-sm">
			<ul>
				{#each items as item, i (i)}
					<li class="ms-6 list-disc">{item.id} {item.name} +{item.quantity}</li>
				{/each}
			</ul>
		</div>
	</details>
{/each}
