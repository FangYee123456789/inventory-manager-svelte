<script lang="ts">
	import { createUser } from '$lib/remote/user.remote';
	const { email, password, role, name } = createUser.fields;

	let isLoading: boolean = $state(false);
	let disabled = $derived(isLoading);
</script>

<form
	{...createUser.enhance(async ({ form, submit }) => {
		isLoading = true;
		if (await submit()) {
			form.reset();
		}
		isLoading = false;
	})}
>
	<fieldset {disabled} class="fieldset w-xs rounded-box border border-base-300 bg-base-200 p-4">
		<legend class="fieldset-legend text-xl">Create new user</legend>
		<!-- <input {...password.as('hidden', String(Math.floor(10000000 + Math.random() * 90000000)))} /> -->
		<input {...password.as('hidden', '12345678')} />
		{#each password.issues() as issue, index (index)}
			<p class="issue">{issue.message}</p>
		{/each}
		<label class="input mb-1">
			<span class="label">Email:</span>
			<input placeholder="example@domain.com" {...email.as('email')} />
		</label>
		{#each email.issues() as issue, index (index)}
			<p class="issue">{issue.message}</p>
		{/each}
		<label class="input mb-1">
			<span class="label">Name:</span>
			<input placeholder="John" {...name.as('text')} />
		</label>
		{#each name.issues() as issue, index (index)}
			<p class="issue">{issue.message}</p>
		{/each}
		<label>
			<input class="radio" {...role.as('radio', 'QS')} required />
			QS
		</label>
		<label>
			<input class="radio" {...role.as('radio', 'Procurement')} />
			Procurement
		</label>
		<label>
			<input class="radio" {...role.as('radio', 'Project')} />
			Project
		</label>
		{#each role.issues() as issue, index (index)}
			<p class="issue">{issue.message}</p>
		{/each}
		<button type="submit" class="btn mt-1">Create</button>
	</fieldset>
</form>

{#if isLoading}
	<p>Loading...</p>
{/if}
