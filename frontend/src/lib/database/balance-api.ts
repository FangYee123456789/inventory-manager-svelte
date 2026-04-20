import type { balance } from "types/supabase";
import { supabase } from "./supabase";

export async function getBalance(projectID: string = "1"): Promise<balance> {
  const { error, data } = await supabase
    .from("projects")
    .select("balance:current_balance")
    .eq("id", projectID)
    .single();
  if (error) {
    console.error("Error retrieving balance: ", error);
    return { balance: 0 };
  }
  return data;
}
