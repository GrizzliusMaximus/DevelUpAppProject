var temp = 0;
if (keyboard_check_pressed(ord('Q'))){
    game_restart();
}
if (keyboard_check(vk_space)){
    var mode_length = 3;
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
            sprite_index = spr_house;
        }
        else if (mode == 1){
            sprite_index = spr_tile;
        }
        else if (mode == 2){
            sprite_index = spr_water;
        }  
        /*   
        else if (mode == 1){
            sprite_index = spr_box;
        }  
        else if (mode == 2){
            sprite_index = spr_box2;
        }
        else if (mode == 3){
            sprite_index = spr_house;
        }
        else if (mode == 4){
            sprite_index = spr_tile;
        }
        */
        else {
            sprite_index = spr_empty;
        }
    }
    //if (PosToGridX(x,y) >= 0 && PosToGridY(x,y) >=0){
        if (mode == 0){
            BuildingDrop(obj_house);
        }
        else if (mode == 1){
            BuildingDrop(obj_tile);
        }
        else if (mode == 2){
            BuildingDrop(obj_water);
        }
    //}
       
    /*
    else if (mode == 1){
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
    else if (mode == 2){
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
    else if (mode == 3){
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
    else if (mode == 4){
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
    */
    else{
         if (mouse_check_button_pressed(mb_left)){
            instance_destroy(instance_position(mouse_x,mouse_y,all));
         }   
    }
    return 1;
}
return 0;
