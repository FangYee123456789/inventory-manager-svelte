import {
  Button,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  Stack,
  TextField,
  Typography,
} from "@mui/material";
import imageCompression from "browser-image-compression";
import { getAllProductCategories } from "lib/database/categories-api";
import { uploadImage } from "lib/database/storage-api";
import { useEffect, useState } from "react";
import type { category } from "types/supabase";

const options = {
  maxSizeMB: 0.08,
  maxWidthOrHeight: 300,
  useWebWorker: true,
};

function AddProductForm() {
  const [files, setFiles] = useState<File[]>([]);
  const [_imageUrls, setImageUrls] = useState<string[]>([]);
  const [productCategories, setProductCategories] = useState<category[]>([]);

  useEffect(() => {
    async function fetchCategories() {
      const categoryArray = await getAllProductCategories();
      setProductCategories(categoryArray);
    }
    fetchCategories();
  }, []);

  //MuiFileInput returns the file directly instead of an event
  function handleFilesChange(files: File[]) {
    if (files) {
      setFiles(files);
    }
  }

  async function handleFormSubmit(e: React.SubmitEvent<HTMLFormElement>) {
    e.preventDefault();
    if (files) {
      files.forEach(async (file) => {
        const compressedFile = await imageCompression(file, options);
        const url = await uploadImage(compressedFile);
        if (!url) return;
        setImageUrls((prev) => [...prev, url]);
      });
    }
  }

  return (
    <form onSubmit={handleFormSubmit}>
      <Stack spacing={2}>
        <Typography variant="h6">Add a new Product</Typography>
        <TextField label="Name" required name="name" />
        <FormControl>
          <InputLabel>Category</InputLabel>
          <Select label="Category" name="categoryID" defaultValue="">
            {productCategories.map(({ id, name }) => (
              <MenuItem value={id} key={id}>
                {name}
              </MenuItem>
            ))}
          </Select>
        </FormControl>
        <TextField
          label="Quantity"
          type="number"
          required
          name="quantity"
          slotProps={{ htmlInput: { min: 0, step: 1 } }}
        />
        <Button
          component="label"
          role={undefined}
          variant="contained"
          color="secondary"
          tabIndex={-1}
        >
          <input type="file" multiple />
        </Button>

        {/* <MuiFileInput
          name="files"
          multiple
          value={files}
          onChange={handleFilesChange}
          slotProps={{ htmlInput: { accept: "image/*" } }}
        /> */}
        <Button type="submit" variant="contained">
          Submit
        </Button>
      </Stack>
    </form>
  );
}

export default AddProductForm;
