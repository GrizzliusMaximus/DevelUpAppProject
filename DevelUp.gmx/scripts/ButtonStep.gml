var button = argument0;
var scale = view_wview[0]/view_wport[0];
var xdis = sprite_get_width(button.spr)*scale;
var ydis = sprite_get_height(button.spr)*scale;
var x1 = (view_xview[0]+button.x*scale);
var y1 = (view_yview[0]+button.y*scale);
var x2 = x1+xdis;
var y2 = y1+ydis;

if (point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2)){
    if (mouse_check_button_pressed(mb_left)){
        button.img = 2;
    }
    else if (mouse_check_button_released(mb_left) && button.img = 2){
        script_execute(button.func);
    }
    else if (!mouse_check_button(mb_left)){
        button.img = 1;
    }
   
}
else{
    button.img = 0;
}

