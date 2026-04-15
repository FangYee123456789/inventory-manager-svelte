import { TextField } from "@mui/material";

function AddProductForm() {
  async function handleSubmit(e: React.SubmitEvent<HTMLFormElement>) {
    e.preventDefault();
    const formData = new FormData(e.target);
    console.log(formData);
  }

  return (
    <>
      <form onSubmit={handleSubmit}>
        <TextField label="Name" required name="name" />
        <TextField label="Category" required name="category" />
        <TextField
          label="Quantity"
          type="number"
          required
          name="quantity"
          slotProps={{ htmlInput: { min: 0, step: 1 } }}
        />
      </form>
    </>
  );
}

export default AddProductForm;
