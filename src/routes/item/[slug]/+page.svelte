<script lang="ts">
	import ItemCard from '$lib/components/itemCard.svelte';

	const { data } = $props();
</script>

{#if !data.item}
	404 not found
{:else}
	<div class="max-w-75">
		<ItemCard {...data.item} />
	</div>
{/if}
