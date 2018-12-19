obj_id = argument0
var ret = 0;

//old code
/*
var yy = floor(mouse_y/16);
var xx = ceil((mouse_x+16)/32);
if ((yy+xx)&1){
    yy++;
}
yy *= 16;
xx = xx*32-16;
if (abs(mouse_y-yy)*2 > (mouse_x-xx+32)){
    xx -= 32;
    if (mouse_y-yy < 0)
        yy = yy - 16;
    else
        yy = yy + 16;
}
*/
var xx = GridLockX(mouse_x,mouse_y);
var yy = GridLockY(mouse_x,mouse_y);
x += (xx-x)/1.5;
y += (yy-y)/1.5;
var gridx = PosToGridX(xx,yy);
var gridy = PosToGridY(xx,yy);
if (!cam_move && gridx >= 0 && gridx < gridx_size && gridy >= 0 && gridy < gridy_size && grid[gridx,gridy] != 0 && grid2[gridx,gridy] == 0){
    image_blend = c_lime;
    if (mouse_check_button_released(mb_left)){
       ret = instance_create(xx,yy,obj_id);
       grid2[gridx,gridy] = ret;
       gui_state = 0;
       sprite_index = spr_empty;
       audio_play_sound(sou_drop,0,0);
       image_blend = c_white;
    }
}
else{
    image_blend = c_red;
}

return ret;
