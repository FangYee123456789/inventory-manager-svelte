<script lang="ts">
	import { tableToCSV } from '$lib/utils/tableToCSV.js';
	import { toast } from 'svelte-sonner';

	const { data } = $props();
	let isReverse = $state<boolean>(true);
	//Iterates through the first item to retrieve each week's date.
	const dates = $derived.by(() => {
		const itemIDs = Object.keys(data.timeline);
		if (itemIDs.length === 0) return undefined;
		const firstID = itemIDs[0];
		return data.timeline[firstID].map((week) => week);
	});

	function exportTable() {
		const table = document.querySelector('#timeline-table');
		if (!table) {
			toast.error('No table found');
			return;
		}
		tableToCSV(table, 'export');
	}

	function toggleReverse() {
		isReverse = !isReverse;
	}

</script>

<button onclick={exportTable} class="btn btn-primary">Export table</button>
<button onclick={toggleReverse} class="btn btn-primary"
	>Showing by {isReverse ? 'latest' : 'last'}</button
>
<table class="table" id="timeline-table">
	<thead>
		<tr>
			<th>Master</th>
			<th>Name</th>
			{#if isReverse}
				{#each dates!.toReversed() as { week } (week)}
					<th scope="col">{week}</th>
				{/each}
			{:else}
				{#each dates as { week } (week)}
					<th scope="col">{week}</th>
				{/each}
			{/if}
		</tr>
	</thead>
	<tbody>
		{#each Object.entries(data.timeline) as [, nameDateQuant], i (i)}
			<tr>
				<th>{nameDateQuant[0].master}</th>
				<td>{nameDateQuant[0].name}</td>
				{#if isReverse}
					{#each nameDateQuant.toReversed() as { quantity }, i (i)}
						<td>{quantity}</td>
					{/each}{:else}
					{#each nameDateQuant as { quantity }, i (i)}
						<td>{quantity}</td>
					{/each}
				{/if}
			</tr>
		{/each}
	</tbody>
</table>
