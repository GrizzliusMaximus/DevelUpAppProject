var button = argument0;
var scale = view_wview[0]/800;
var xdis = sprite_get_width(button.spr)*scale;
var ydis = sprite_get_height(button.spr)*scale;
var x1 = (view_xview[0]+button.x*scale);
var y1 = (view_yview[0]+button.y*scale);
var x2 = x2-xdis;
var y2 = y2-ydis;

if (point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2)){
    if (mouse_check_button(mb_left)){
        button.img = 2;
        //draw_sprite(spr_button,2,x,y);
    }
    else{
        button.img = 1;
        //draw_sprite(spr_button,1,x,y);
    }
}
else{
    button.img = 0;
    //draw_sprite(spr_button,0,x,y);
}

