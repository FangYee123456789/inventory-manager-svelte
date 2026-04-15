import { Button, Stack, TextField } from "@mui/material";
import { uploadImage } from "lib/database/storage-api";
import { MuiFileInput } from "mui-file-input";
import { useState } from "react";

function AddProductForm() {
  const [files, setFiles] = useState<File[]>([]);
  const [imageUrls, setImageUrls] = useState<string[]>([]);

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
        const url = await uploadImage(file);
        if (!url) return;
        setImageUrls((prev) => [...prev, url]);
      });
    }
  }

  return (
    <>
      {imageUrls.map((url) => (
        <img src={url} />
      ))}
      <form onSubmit={handleFormSubmit}>
        <Stack spacing={2}>
          <TextField label="Name" required name="name" />
          <TextField label="Category" required name="category" />
          <TextField
            label="Quantity"
            type="number"
            required
            name="quantity"
            slotProps={{ htmlInput: { min: 0, step: 1 } }}
          />
          <MuiFileInput
            name="files"
            multiple
            value={files}
            onChange={handleFilesChange}
            slotProps={{ htmlInput: { accept: "image/*" } }}
          />
          <Button type="submit" variant="contained">
            Submit
          </Button>
        </Stack>
      </form>
    </>
  );
}

export default AddProductForm;
