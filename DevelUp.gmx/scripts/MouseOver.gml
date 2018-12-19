if (!global.world.gui_state && PosToGridX(mouse_x,mouse_y) == PosToGridX(x,y) && PosToGridY(mouse_x,mouse_y) == PosToGridY(x,y))
    return 1;
return 0;
