export type product = {
    master_id: number;
    name: string;
    photo_paths: string[];
    current_quantity: number;
    product_categories: productCategory;
};

export type productCategory = {
    id: number;
    name: string;
};
