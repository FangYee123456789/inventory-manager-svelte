<script lang="ts">
	import favicon from '$lib/assets/favicon.ico';
	import './layout.css';

	let { children } = $props();
</script>

<svelte:head>
	<title>Webi Wabo 3</title>
	<link rel="icon" href={favicon} />
</svelte:head>
{@render children()}
