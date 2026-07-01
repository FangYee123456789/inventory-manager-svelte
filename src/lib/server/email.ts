import { GOOGLE_APP_PASSWORD, GOOGLE_EMAIL } from '$env/static/private';
import nodemailer from 'nodemailer';

const transporter = nodemailer.createTransport({
	service: 'gmail',
	auth: {
		user: GOOGLE_EMAIL,
		pass: GOOGLE_APP_PASSWORD
	}
});

export async function testNodemailer() {
	try {
		await transporter.verify();
		console.log('Server is ready to take our messages');
	} catch (e) {
		console.error('Verification failed:', e);
	}
}
