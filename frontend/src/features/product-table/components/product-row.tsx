import { Button, TableCell, TableRow } from "@mui/material";
import { RoleContext } from "lib/context/context";
import { truncateStringEllipsis } from "lib/miscellaneous";
import { useContext } from "react";
import type { product } from "types/supabase";
import ProductImage from "./product-image";

interface props {
  product: product;
  handleProductSelection: (productID: string, productName: string, productQuantity: number) => void;
}

function ProductRow({ product, handleProductSelection }: props) {
  const role = useContext(RoleContext);

  return (
    <TableRow className={product.isDisabled ? "disabled-row" : ""}>
      <TableCell>{product.masterID}</TableCell>
      <TableCell>{truncateStringEllipsis(product.name, 20)}</TableCell>
      <ProductImage name={product.name} photoPaths={product.photoPaths} />
      <TableCell>{truncateStringEllipsis(product.category.name, 10)}</TableCell>
      <TableCell align="right">{product.quantity}</TableCell>
      <TableCell>
        {(role == "Procurement" || role == "Project") && !product.isDisabled && (
          <Button
            variant="outlined"
            onClick={() => handleProductSelection(product.masterID, product.name, product.quantity)}
          >
            Modify
          </Button>
        )}
      </TableCell>
    </TableRow>
  );
}

export default ProductRow;
