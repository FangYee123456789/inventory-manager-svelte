import {
  Dialog,
  DialogContent,
  DialogTitle,
  ImageList,
  ImageListItem,
  TableCell,
} from "@mui/material";
import { useState } from "react";

interface props {
  name: string;
  photoPaths: string[];
}

export default function ProductImage({ name, photoPaths }: props) {
  const [isOpen, setIsOpen] = useState(false);

  function toggleModal(e: React.MouseEvent<HTMLAnchorElement>) {
    e.preventDefault();
    setIsOpen(!isOpen);
  }

  return (
    <TableCell>
      <ImageList cols={1} sx={{ width: "300px" }}>
        <ImageListItem>
          <a onClick={toggleModal}>
            <img src={photoPaths[0]} alt="" width="300px" />
          </a>
        </ImageListItem>
      </ImageList>
      <Dialog open={isOpen} onClose={toggleModal} fullWidth={true} maxWidth="lg">
        <DialogTitle sx={{ paddingBottom: 0 }}>{name}</DialogTitle>
        <DialogContent>
          <ImageList cols={3} gap={30}>
            {photoPaths.map((url) => (
              <ImageListItem>
                <img src={url} />
              </ImageListItem>
            ))}
          </ImageList>
        </DialogContent>
      </Dialog>
    </TableCell>
  );
}
