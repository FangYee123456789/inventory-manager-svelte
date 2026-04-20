import { Container, Grid } from "@mui/system";
import BalanceManager from "features/balance-manager/balance-manager";
import ProductTable from "features/product-table/product-table";
import TransactionLog from "features/transaction-log/transaction-log";

export default function ProductDashboard() {
  return (
    <Container maxWidth={false} sx={{ marginX: 2 }}>
      <Grid container spacing={2}>
        <Grid size={12}>
          <BalanceManager />
        </Grid>
        <Grid size={{ sm: 12, lg: 8 }} component="section">
          <ProductTable />
        </Grid>
        <Grid size={4} component="section">
          <TransactionLog />
        </Grid>
      </Grid>
    </Container>
  );
}
