import { supabase } from "lib/database/supabase";
import type { deliveryOrder } from "types/supabase";

type returnValue = {
    deliveryOrderID: string;
};

export async function insertNewDeliveryOrder(
    supplierID: string,
    orderID: string,
    orderDate: Date,
): Promise<string> {
    const { error, data } = await supabase
        .from("delivery_orders")
        .insert({
            supplier_id: supplierID,
            order_id: orderID,
            order_date: orderDate,
        })
        .select("deliveryOrderID:id")
        .single();
    if (error) {
        console.error("Error inserting delivery order: ", error);
        return "";
    }
    return (data as returnValue).deliveryOrderID;
}

export async function getDeliveryOrderByID(
    id: string,
): Promise<deliveryOrder[]> {
    const { error, data } = await supabase
        .from("delivery_orders")
        .select(
            "orderID:order_id, orderDate:order_date, supplier:suppliers(name)",
        )
        .eq("id", id)
        .returns<deliveryOrder[]>();
    if (error) {
        console.error("Error retrieving delivery order by ID: ", error);
        return [];
    }

    return data;
}
