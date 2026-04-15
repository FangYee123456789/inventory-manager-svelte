import { Button } from "@mui/material";
import { useState } from "react";
import Navbar from "./components/navbar/navbar";
import SideDrawer from "./components/side-drawer/side-drawer";

function Navigation() {
  const [isDrawerOpen, setDrawerOpen] = useState(false);

  function toggleDrawer() {
    setDrawerOpen(!isDrawerOpen);
  }

  return (
    <>
      <Button onClick={toggleDrawer}>adf</Button>
      <Navbar toggleDrawer={toggleDrawer} />
      <SideDrawer isOpen={isDrawerOpen} toggleDrawer={toggleDrawer} />
    </>
  );
}

export default Navigation;
