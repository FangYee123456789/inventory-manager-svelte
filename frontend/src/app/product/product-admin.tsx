import { Grid } from "@mui/system";
import AddProductForm from "features/add-product/add-product-form";

export default function ProductAdmin() {
  return (
    <>
      <Grid container>
        <Grid size="grow" />
        <Grid size={3}>
          <AddProductForm />
        </Grid>
        <Grid size="grow" />
      </Grid>
    </>
  );
}
