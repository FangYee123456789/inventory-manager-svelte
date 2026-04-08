import { useState, useEffect } from "react";
import { supabase } from "lib/supabase";
import type { product } from "types/supabase";
import ProductRow from "./components/product-row";

function ProductTable() {
    const [products, setProducts] = useState<product[]>([]);

    useEffect(() => {
        async function getProducts() {
            const { error, data } = await supabase
                .from("products")
                .select(`*, product_categories(name)`)
                .order("master_id", { ascending: true });
            if (error) {
                console.error("Error retrieving products: ", error);
                return;
            }
            setProducts(data);
        }
        getProducts();
    }, []);

    return (
        <table className="table is-bordered is-narrow is-hoverable is-full-width cell">
            <thead className="thead-dark">
                <tr>
                    <th scope="col">Master</th>
                    <th scope="col">Name</th>
                    <th scope="col">Photos</th>
                    <th scope="col">Category</th>
                    <th scope="col">Quant</th>
                    <th scope="col">Modify</th>
                </tr>
            </thead>
            <tbody>
                {products.map((product) => (
                    <ProductRow product={product} key={product.master_id} />
                ))}
            </tbody>
        </table>
    );
}

export default ProductTable;
