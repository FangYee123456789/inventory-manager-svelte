<script lang="ts">
	import { resolve } from '$app/paths';

	const { data } = $props();
</script>

<div class="breadcrumbs text-sm">
	<ul>
		<li><a href={resolve('/item')}>Item List</a></li>
		<li>Add Item</li>
	</ul>
</div>

{#if !data.item}
	404 not found
{:else}
	<div class="max-w-75">item here</div>
{/if}
