#define WorldStep
instance_activate_all();
xpos = PosToGridX(x,y);
ypos = PosToGridY(x,y);
GrowthStep();
if (keyboard_check_pressed(ord('Q'))){
    surface_free(surf_world);
    /*
    surface_free(surf_world2);
    surface_free(surf_world3);
    surface_free(surf_world4);
    */
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
                WBuildHouse();
                break;
            case 1:
                WBuildFarm();
                break;
            case 2:
                WBuildSawmill();
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
WorldActivation();


#define WorldActivation
if (view_scale >= 4){
    exit;
}
instance_deactivate_region(view_xview[0] - 256*view_scale, view_yview[0] - 256*view_scale, view_wview[0] + 256*view_scale, view_hview[0] + 256*view_scale, false,true);
var i;
for (i = 0; i < arrbtn_size; i++){
    instance_activate_object(button[i]);
}
for (i = 0; i < arrbtn2_size; i++){
    instance_activate_object(button2[i]);
}


#define ResetReq
goldreq = 0;
woodreq = 0;

#define TakeReq
gold -= goldreq;
wood -= woodreq;
ResetReq();