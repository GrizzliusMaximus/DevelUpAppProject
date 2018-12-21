var i;
/*
draw_text(0,view_hport[0]-16,fps);
draw_text(0,view_hport[0]-32,fps_real);
draw_text(0,view_hport[0]-48,view_scale);
draw_text(0,view_hport[0]-64,cam_move);
*/


switch (gui_state){
    case 0:
        for(i = 0; i < arrbtn_size; i++){
            with(button[i]){
                draw_sprite(spr,img,x,y);
            }  
        }
        
        break;
    case 1:
        draw_set_alpha(0.5);
        draw_set_color(c_black);
        draw_rectangle(0,0,view_wport[0],view_hport[0],0);
        draw_set_alpha(1);
        for(i = 0; i < arrbtn2_size; i++){
            with(button2[i]){
                draw_sprite(spr,img,x,y);
                draw_sprite(spr2,0,x,y+8);
            }  
        }
        draw_sprite(button2[10].spr,button2[10].img,button2[10].x,button2[10].y);
        
        for(i = 0; i < arrbtn2_size; i++){
            if (ButtonHover(button2[i])){
                draw_set_alpha(0.5)
                draw_set_color(c_blue);
                draw_rectangle(window_mouse_get_x()+16,window_mouse_get_y(),window_mouse_get_x() + 128,window_mouse_get_y() + 64,0);
                draw_set_alpha(1);
                draw_set_color(c_white);
                draw_text(window_mouse_get_x()+16, window_mouse_get_y(),string(buildname[i]));
                if (buildgold[i] <= gold) draw_set_color(c_white);
                else draw_set_color(c_red);
                draw_text(window_mouse_get_x()+16, window_mouse_get_y() + 16,"Gold: " + string(buildgold[i]));
                if (buildwood[i] <= wood) draw_set_color(c_white);
                else draw_set_color(c_red);
                draw_text(window_mouse_get_x()+16, window_mouse_get_y() + 32,"Wood: " + string(buildwood[i]));
                if (buildnum[i] < buildmax[i]) draw_set_color(c_white);
                else draw_set_color(c_red);
                draw_text(window_mouse_get_x()+16, window_mouse_get_y() + 48,"Built: " + string(buildnum[i]) + "/" + string(buildmax[i]));
            }
        }
        break;
    case 2:
        draw_sprite(button2[10].spr,button2[10].img,button2[10].x,button2[10].y);
        var gridx = PosToGridX(GridLockX(mouse_x,mouse_y),GridLockY(mouse_x,mouse_y));
        var gridy = PosToGridY(GridLockX(mouse_x,mouse_y),GridLockY(mouse_x,mouse_y));
        if (gridx >= 0 && gridx < gridx_size && gridy >= 0 && gridy < gridy_size && grid[gridx,gridy] != 0 && grid2[gridx,gridy] == 0){
            switch (build_mode){
                case 1:
                    draw_set_alpha(0.5)
                    draw_set_color(c_blue);
                    draw_rectangle(window_mouse_get_x()+16,window_mouse_get_y(),window_mouse_get_x() + 192,window_mouse_get_y() + 16,0);
                    draw_set_alpha(1);
                    draw_set_color(c_white);
                    draw_text(window_mouse_get_x()+16,window_mouse_get_y(),"Growth Factor: " + string(25-LandAdjacent2(PosToGridX(x,y),PosToGridY(x,y),2,cum)));
                    break;
                case 2:
                    draw_set_alpha(0.5)
                    draw_set_color(c_blue);
                    draw_rectangle(window_mouse_get_x()+16,window_mouse_get_y(),window_mouse_get_x() + 192,window_mouse_get_y() + 16,0);
                    draw_set_alpha(1);
                    draw_set_color(c_white);
                    draw_text(window_mouse_get_x()+16,window_mouse_get_y(),"Growth Factor: " + string(LandAdjacent2(PosToGridX(x,y),PosToGridY(x,y),2,tcum)));
                    break;
            }
        } 
            
        break;
}

draw_set_color(c_white);
draw_text(0,0,"gold: " + string(floor(gold)));
draw_text(0,16,"wood: " + string(floor(wood)) + "/" + string(maxwood));
draw_text(0,32,"food: " + string(floor(food)) + "/" + string(maxfood));
draw_text(0,48,"happ: " + string(floor(happiness)));
draw_text(0,64,"popu: " + string(floor(population)) + "/" + string(maxpop));
draw_text(0,80,"free: " + string(unemployed) + "/" + string(floor(population)))
draw_text(0,96,"grow: " + string(growth) + "/sec");
draw_text(0,112,"hunger: " + string(floor(hunger)));
