import { PUBLIC_SUPABASE_PUBLISHABLE_KEY, PUBLIC_SUPABASE_URL } from '$env/static/public';
import { createClient } from '@supabase/supabase-js';
import { error as svelteError } from '@sveltejs/kit';

const supabaseUrl = PUBLIC_SUPABASE_URL;
const supabaseKey = PUBLIC_SUPABASE_PUBLISHABLE_KEY;

export const supabase = createClient(supabaseUrl, supabaseKey);

export async function uploadFile(file: File, name: string) {
	const { data, error } = await supabase.storage
		.from('item-photos')
		.upload(`public/${name}.jpg`, file);

	if (error) {
		console.log(error);
		svelteError(500, 'Failed to upload file.');
	} else {
		return await publicUrl(data.path);
	}
}

export async function publicUrl(name: string) {
	const { data } = supabase.storage.from('item-photos').getPublicUrl(name);
	return data.publicUrl;
}
