export type User = {
	id: string;
	email: string;
	name: string;
	passwordHash: string;
	role: string;
};

export type SessionClient = {
	id: string;
	createdAt: Date;
	userID: string;
};

export type Session = SessionClient & {
	secretHash: Uint8Array;
};

export type SessionWithToken = Session & {
	token: string;
};
