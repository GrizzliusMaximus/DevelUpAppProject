xpos = PosToGridX(x,y);
ypos = PosToGridY(x,y);
if (keyboard_check_pressed(ord('Q'))){
    game_restart();
}
if (keyboard_check_pressed(vk_f10)){
    game_end();
}
switch(gui_state){
    case 0:
       // if (TestStep()){ return 0; }
        CamControls();
        for(i = 0; i < arrbtn_size; i++){
            ButtonStep(button[i]);
        }
        break;
    case 1:
        if(keyboard_check_pressed(vk_escape)){
            gui_state = 0;
            sprite_index = spr_empty;
        }
        for(i = 0; i < arrbtn2_size; i++){
            ButtonStep(button2[i]);
        }
        break;
    case 2:
        if(keyboard_check_pressed(vk_escape)){
            gui_state = 0;
            sprite_index = spr_empty;
        }
        switch(build_mode){
            case 0:
                BuildingDrop(obj_house);
                break;
            case 1:
                BuildingDrop(obj_farmland);
                break;
            default:
                if (mouse_check_button_pressed(mb_left)){
                    instance_destroy(instance_position(GridLockX(mouse_x,mouse_y),GridLockY(mouse_x,mouse_y),all));
                    gui_state = 0;
                }  
                break;
        }
        CamControls();
        break;
        
}

