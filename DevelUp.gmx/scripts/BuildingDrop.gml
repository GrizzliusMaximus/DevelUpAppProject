obj_id = argument0
var ret = noone;

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
if (mouse_check_button_pressed(mb_left)){
   ret = instance_create(xx,yy,obj_id);
}
return ret;
