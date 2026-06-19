<script lang="ts">
	const { data } = $props();
	const dates = $derived.by(() => {
		const itemIDs = Object.keys(data.timeline);
		const firstID = itemIDs[0];
		return data.timeline[firstID].map((week) => week);
	});
</script>

<table class="table">
	<thead>
		<tr>
			<th></th>
			{#each dates as { week } (week)}
				<th scope="col">{week}</th>
			{/each}
		</tr>
	</thead>
	<tbody>
		{#each Object.entries(data.timeline) as [id, dateQuant], i (i)}
			<tr>
				<th>{id}</th>
				{#each dateQuant as { quantity }, i (i)}
					<td>{quantity}</td>
				{/each}
			</tr>
		{/each}
	</tbody>
</table>
