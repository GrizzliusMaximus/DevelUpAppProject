obj_id = argument0
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
x += (xx-x)/1.5;
y += (yy-y)/1.5;
if (mouse_check_button_pressed(mb_left)){
    instance_create(xx,yy,obj_id);
}
