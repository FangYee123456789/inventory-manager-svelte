import imageCompression from 'browser-image-compression';

export async function compressImage(file: File): Promise<File> {
	const options = {
		maxSizeMB: 0.1,
		maxWidthOrHeight: 500,
		useWebWorker: true
	};

	console.log('originalFile instanceof Blob', file instanceof Blob);
	console.log(`originalFile size ${file.size / 1024 / 1024} MB`);

	try {
		const compressedFile = await imageCompression(file, options);
		console.log('compressedFile instanceof Blob', compressedFile instanceof Blob);
		console.log(`compressedFile size ${compressedFile.size / 1024 / 1024} MB`);
		return compressedFile;
	} catch (error) {
		console.log(error);
		return file;
	}
}
