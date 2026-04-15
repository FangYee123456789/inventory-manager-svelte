import { Box, Drawer } from "@mui/material";

interface props {
  isOpen: boolean;
  toggleDrawer: () => void;
}

const drawerList = (
  <Box sx={{ width: 250 }} role="presentation">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt debitis laborum sed alias,
    earum labore magni sequi dolor nobis dignissimos blanditiis vel maiores commodi reiciendis
    tempore laudantium adipisci nam dolore.
  </Box>
);

function SideDrawer({ isOpen, toggleDrawer }: props) {
  return (
    <Drawer open={isOpen} onClick={toggleDrawer}>
      {drawerList}
    </Drawer>
  );
}

export default SideDrawer;
