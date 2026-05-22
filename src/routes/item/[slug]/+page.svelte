<script lang="ts">
	import { resolve } from '$app/paths';
	import Form from '$lib/components/base/form.svelte';
	import Input from '$lib/components/base/input.svelte';
	import { editMaster, editName } from '$lib/remote/item.remote';
	import type { Item } from '$lib/types/databaseTypes.js';

	const { data } = $props();
	let { id, master, name, category, categoryID, supplier, supplierID, quantity }: Item = $derived(
		data.item
	);
</script>

<div class="breadcrumbs text-sm">
	<ul>
		<li><a href={resolve('/')} class="underline">Home</a></li>
		<li><a href={resolve('/item')} class="underline">Item List</a></li>
		<li>Add Item</li>
	</ul>
</div>

{#if !data.item}
	404 not found
{:else}
	<div class="max-w-75">
		{@render editForm(editMaster, editMaster.fields.master, master, 'Master')}
		{@render editForm(editName, editName.fields.name, name, 'Name')}
	</div>
{/if}

<!-- eslint-disable-next-line @typescript-eslint/no-explicit-any -->
{#snippet editForm(remoteForm: any, field: unknown, value: string, label: string)}
	<Form
		{remoteForm}
		errorMsg="Failed to update master number."
		successMsg="Master number has been updated."
	>
		<input {...remoteForm.fields.id.as('hidden', id)} />
		<Input {field} {value} type="text" placeholder={value} {label} rightButton="Edit" />
	</Form>
{/snippet}
