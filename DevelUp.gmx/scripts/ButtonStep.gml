var button = argument0;
var scale = view_wview[0]/view_wport[0];
var xdis = sprite_get_width(button.spr)*scale/2;
var ydis = sprite_get_height(button.spr)*scale/2;
var x0 = (view_xview[0]+button.x*scale);
var y0 = (view_yview[0]+button.y*scale);
var x1 = x0-xdis;
var y1 = y0-ydis;
var x2 = x0+xdis;
var y2 = y0+ydis;
var ret = 0;

if (point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2)){
    if (mouse_check_button_pressed(mb_left)){
        button.img = 2;
    }
    else if (mouse_check_button_released(mb_left) && button.img = 2){
        script_execute(button.func);
        ret = 1;
    }
    else if (!mouse_check_button(mb_left)){
        button.img = 1;
    }
   
}
else{
    button.img = 0;
}
return ret;

