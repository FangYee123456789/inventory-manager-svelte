<script lang="ts">
	import type { EnhanceParams } from '$lib/types/types';
	import { toast } from 'svelte-sonner';

	let {
		remoteForm,
		legend,
		children,
		errorMsg,
		successMsg,
		classes = '',
		enhanceCallback = defaultEnhance
	} = $props();

	let isLoading = $state<boolean>(false);

	async function defaultEnhance({ form, submit }: EnhanceParams) {
		isLoading = true;
		if (await submit!()) {
			if (remoteForm.result?.success !== false) form!.reset();
			if (remoteForm.result.success) {
				toast.success(successMsg);
			} else {
				toast.error(errorMsg);
			}
		}

		isLoading = false;
	}
</script>

<form
	enctype="multipart/form-data"
	class="w-full max-w-100 {classes}"
	{...remoteForm.enhance(enhanceCallback)}
>
	<fieldset
		class="fieldset gap-0 rounded-box border border-base-300 bg-base-200 p-4"
		disabled={isLoading}
	>
		<legend class="fieldset-legend text-xl">{legend}</legend>
		{@render children()}
		{#if isLoading}
			<p>Loading...</p>
		{/if}
	</fieldset>
</form>
