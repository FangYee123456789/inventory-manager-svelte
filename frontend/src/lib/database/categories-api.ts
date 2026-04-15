import type { category } from "types/supabase";
import { supabase } from "./supabase";

export async function getAllProductCategories(): Promise<category[]> {
  const { error, data } = await supabase.from("product_categories").select("*");
  if (error) {
    console.error("Error retrieving categories: ", error);
    return [];
  }
  return data;
}
