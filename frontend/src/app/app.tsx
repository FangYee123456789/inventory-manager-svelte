import "bulma/css/bulma.min.css";
import ProductTable from "features/product-table/product-table";
import ProductLog from "features/transaction-log/transaction-log";

function App() {
    return (
        <main className="columns m-5">
            <ProductTable />
            <ProductLog />
        </main>
    );
}

export default App;
