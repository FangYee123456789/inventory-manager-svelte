import { PUBLIC_SUPABASE_PUBLISHABLE_KEY, PUBLIC_SUPABASE_URL } from '$env/static/public';
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = PUBLIC_SUPABASE_URL;
const supabaseKey = PUBLIC_SUPABASE_PUBLISHABLE_KEY;

export const supabase = createClient(supabaseUrl, supabaseKey);

export async function uploadFile(file: File, name: string) {
	const { data, error } = await supabase.storage
		.from('item-photos')
		.upload(`public/${name}.jpg`, file);
	console.log(data);

	if (error) {
		console.error(error);
	} else {
		return data;
	}
}

export async function publicUrl(name: string) {
	const { data } = supabase.storage.from('item-photos').getPublicUrl(name);
	return data.publicUrl;
}
