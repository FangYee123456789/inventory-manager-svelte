export type product = {
    masterID: string;
    name: string;
    photoPaths: string[];
    quantity: number;
    category: {
        name: string;
    };
    isDisabled: boolean;
};

export type transaction = {
    id: string;
    creationTimestamp: Date;
    logger: {
        firstName: string;
    };
    product: {
        name: string;
    };
    quantityChanged: number;
};
