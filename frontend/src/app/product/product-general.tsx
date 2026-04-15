import { Container, Grid } from "@mui/system";
import ProductTable from "features/product-table/product-table";
import TransactionLog from "features/transaction-log/transaction-log";

export default function ProductDashboard() {
  return (
    <Grid container spacing={2} component={Container} maxWidth="xl">
      <Grid size={{ sm: 12, lg: 8 }} component="section">
        <ProductTable />
      </Grid>
      <Grid size={4} component="section">
        <TransactionLog />
      </Grid>
    </Grid>
  );
}
