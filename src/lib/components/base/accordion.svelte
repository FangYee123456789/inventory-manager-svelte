<script lang="ts">
	import type { EnhanceParams } from '$lib/types/types';
	import type { Snippet } from 'svelte';
	import { toast } from 'svelte-sonner';

	type Props = {
		elementID: string;
		summaryStart: Snippet;
		summaryEnd: Snippet;
		content: Snippet;
		// eslint-disable-next-line @typescript-eslint/no-explicit-any
		deleteForm: any;
		deletePrompt: string;
		deleteSuccess: string;
		deleteFail: string;
		deleteFormChildren: Snippet;
	};

	const {
		elementID,
		summaryStart,
		summaryEnd,
		content,
		deleteForm,
		deletePrompt,
		deleteSuccess,
		deleteFail,
		deleteFormChildren
	}: Props = $props();
	let modal: HTMLDialogElement;

	function openDeleteConfirmation() {
		modal.showModal();
	}

	export function closeDeleteConfirmation() {
		modal.close();
	}
</script>

<details class="collapse border border-base-300" name="accordion" open>
	<summary class="collapse-title font-semibold">
		<div class="flex items-center justify-between gap-10">
			{@render summaryStart()}
			<span class="flex items-center justify-center">
				{@render summaryEnd()}
				<button
					class="btn size-12.5 btn-soft btn-error"
					aria-label="delete"
					onclick={openDeleteConfirmation}>
					<span class="icon-[tabler--trash]"></span>
				</button>
			</span>
		</div>
	</summary>
	<div class="text-md collapse-content">
		{@render content()}
	</div>
</details>

<dialog id={elementID} class="modal" bind:this={modal}>
	<div class="modal-box">
		<h2 class="text-lg">{deletePrompt}</h2>
		<div class="modal-action">
			<form method="dialog">
				<button class="btn btn-soft btn-secondary">Cancel</button>
			</form>
			<form
				{...deleteForm.enhance(async ({ submit }: EnhanceParams) => {
					if (await submit!()) {
						closeDeleteConfirmation();
						const { success, message } = deleteForm.result!;
						if (success) {
							toast.success(deleteSuccess);
						} else {
							toast.error(message || deleteFail);
						}
					}
				})}>
				{@render deleteFormChildren()}
			</form>
		</div>
	</div>
</dialog>
