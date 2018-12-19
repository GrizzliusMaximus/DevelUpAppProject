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

if (point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2)){
    return 1;
}
return 0;
