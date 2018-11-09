if (keyboard_check_pressed(ord('Q'))){
    game_restart();
}

if (keyboard_check(vk_space)){
    var xdiff = mouse_x-view_xview[0];
    var ydiff = mouse_y-view_yview[0];
    x = mouse_x;
    y = mouse_y;
    if (mouse_check_button_pressed(mb_left)){
        xprev = mouse_x;
        yprev = mouse_y;
    }
    else if (mouse_check_button(mb_left)){
        view_xview[0] -= mouse_x-xprev;
        view_yview[0] -= mouse_y-yprev;
        //xprev = mouse_x*2 -xprev;
        //yprev = mouse_y*2 -yprev;
        return 0;
    }
    else if (mouse_wheel_down() && view_scale < 2){
        view_scalew*=1.2;
        view_scaleh*=1.2;
        view_scale *= 1.2;
    }
    else if (mouse_wheel_up()&& view_scale > 0.5){
        view_scalew/=1.2;
        view_scaleh/=1.2;
        view_scale /= 1.2;
    }
    var vieww_old= view_wview[0];
    view_wview[0] += round((view_scalew-view_wview[0])/2);
    var viewh_old= view_hview[0];
    view_hview[0] += round((view_scaleh-view_hview[0])/2) ;
    view_xview[0] = mouse_x - xdiff*(view_wview[0]/vieww_old);
    view_yview[0] = mouse_y - ydiff*(view_hview[0]/viewh_old);
    return 0;
}


var mode_length = 5;
if (mouse_wheel_down()){
    mode--;
    if (mode < 0)
        mode = mode_length;
}
else if (mouse_wheel_up()){
    mode++;
    if (mode > mode_length)
        mode = 0;
}

if (mouse_wheel_up() || mouse_wheel_down()){
    if (mode == 0){
        sprite_index = spr_box;
    }    
    else if (mode == 1){
        sprite_index = spr_box2;
    }
    else if (mode == 2){
        sprite_index = spr_house;
    }
    else if (mode == 3){
        sprite_index = spr_tile;
    }
    else {
        sprite_index = spr_empty;
    }
}


if (mode == 0){
    var yy = floor(mouse_y/16);
    var xx = ceil((mouse_x-16)/48);
    if ((yy+xx)&1){
        yy++;
    }
    yy *= 16;
    xx = xx*48+16;
    if (abs(mouse_y-yy)*3 > (mouse_x-xx+48)){
        xx -= 48;
        if (mouse_y-yy < 0)
            yy = yy - 16;
        else
            yy = yy + 16;
    }
    x += (xx-x)/1.5;
    y += (yy-y)/1.5;
    if (mouse_check_button_pressed(mb_left)){
        
        instance_create(xx,yy,obj_box);
    }
}
else if (mode == 1){
    var yy = floor(mouse_y/16);
    var xx = ceil((mouse_x+32)/48);
    if ((yy+xx)&1){
        yy++;
    }
    yy *= 16;
    xx = xx*48-32;
    if (abs(mouse_y-yy)*3 > (mouse_x-xx+48)){
        xx -= 48;
        if (mouse_y-yy < 0)
            yy = yy - 16;
        else
            yy = yy + 16;
    }
    x += (xx-x)/1.5;
    y += (yy-y)/1.5;
    if (mouse_check_button_pressed(mb_left)){
        
        instance_create(xx,yy,obj_box2);
    }
}
else if (mode == 2){
    var yy = floor(mouse_y/16);
    var xx = ceil((mouse_x-16)/48);
    if ((yy+xx)&1){
        yy++;
    }
    yy *= 16;
    xx = xx*48+16;
    if (abs(mouse_y-yy)*3 > (mouse_x-xx+48)){
        xx -= 48;
        if (mouse_y-yy < 0)
            yy = yy - 16;
        else
            yy = yy + 16;
    }
    x += (xx-x)/1.5;
    y += (yy-y)/1.5;
    if (mouse_check_button_pressed(mb_left)){
        
        instance_create(xx,yy,obj_box3);
    }
}
else if (mode == 3){
    var yy = floor(mouse_y/16);
    var xx = ceil((mouse_x+32)/48);
    if ((yy+xx)&1){
        yy++;
    }
    yy *= 16;
    xx = xx*48-32;
    if (abs(mouse_y-yy)*3 > (mouse_x-xx+48)){
        xx -= 48;
        if (mouse_y-yy < 0)
            yy = yy - 16;
        else
            yy = yy + 16;
    }
    x += (xx-x)/1.5;
    y += (yy-y)/1.5;
    if (mouse_check_button_pressed(mb_left)){
        
        instance_create(xx,yy,obj_tile);
    }
}
else{
     if (mouse_check_button_pressed(mb_left)){
        instance_destroy(instance_position(mouse_x,mouse_y,all));
     }   
}
xpos = scr_PostoGridX(x,y);
ypos = scr_PostoGridY(x,y);




