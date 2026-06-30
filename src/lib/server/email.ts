import nodemailer from 'nodemailer';

const transporter = nodemailer.createTransport({
	service: 'gmail', // Shortcut for Gmail's SMTP settings - see Well-Known Services
	auth: {
		type: 'OAuth2',
		user: 'me@gmail.com',
		clientId: process.env.GOOGLE_CLIENT_ID,
		clientSecret: process.env.GOOGLE_CLIENT_SECRET,
		refreshToken: process.env.GOOGLE_REFRESH_TOKEN
	}
});
