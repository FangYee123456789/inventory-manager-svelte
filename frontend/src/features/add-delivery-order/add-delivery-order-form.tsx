import { TextField, Typography } from "@mui/material";
import AutocompleteComponent from "lib/components/autocomplete-component";
import { getAllSuppliers, insertNewSupplier } from "lib/database/suppliers-api";
import { useEffect, useState } from "react";
import type { supplier } from "types/supabase";
import AddItemElement from "./add-item-element";

export default function AddDeliveryOrderForm() {
  const [suppliers, setSuppliers] = useState<supplier[]>([]);
  const [selectedSupplierID, setSelectedSupplierID] = useState("");

  useEffect(() => {
    async function fetchSuppliers(): Promise<void> {
      const suppliersArray = await getAllSuppliers();
      setSuppliers(suppliersArray);
    }
    fetchSuppliers();
  }, []);

  function handleSubmit(e: React.SubmitEvent<HTMLFormElement>) {
    e.preventDefault();
    const data: FormData = new FormData(e.target);

    const date = data.get("date");
    const supplierID = selectedSupplierID;
    const ref = data.get("ref");
    const items = data.getAll("item")

    console.log(`${date} ${supplierID} ${ref} ${items}`)
  }

  return (
    <form onSubmit={handleSubmit}>
      <Typography variant="h5">Add Delivery Order</Typography>
      <Typography variant="h6">Delivery Order Info</Typography>
      <TextField
        required
        type="date"
        label="Delivery Date"
        slotProps={{ inputLabel: { shrink: true } }}
        defaultValue={new Date().toISOString().split("T")[0]}
        name="date"
        fullWidth
        margin="normal"
      />
      <AutocompleteComponent
        label="Supplier"
        optionsArray={suppliers}
        databaseInsert={insertNewSupplier}
        returnIDAsValue={setSelectedSupplierID}
        isRequired={true}
      />
      <TextField label="Ref" required fullWidth margin="normal" name="ref"/>
      <hr/>
      <Typography variant="h6" sx={{marginBottom: 2}}>Items</Typography>
      <AddItemElement/>
    </form>
  );
}