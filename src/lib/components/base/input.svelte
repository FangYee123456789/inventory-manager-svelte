<script lang="ts">
	import InputIssues from './inputIssues.svelte';

	const { label, type, field, placeholder = '', value = '', rightButton = '' } = $props();
</script>

<div class="mb-4">
	<label class="input w-full pr-0">
		<span class="label">{label}:</span>
		<input {...field.as(type, value)} {placeholder} />
		{#if rightButton !== ''}
			<button class="btn rounded-s-none btn-primary">{rightButton}</button>
		{/if}
	</label>
	<InputIssues {field} />
</div>
