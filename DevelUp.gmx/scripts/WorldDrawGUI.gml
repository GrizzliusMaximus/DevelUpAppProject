var i;
draw_text(0,view_hport[0]-16,fps);
draw_text(0,view_hport[0]-32,fps_real);
draw_text(0,view_hport[0]-48,view_scale);
if (gui_state != 1){
    draw_set_color(c_white);
    draw_text(0,0,"gold: " + string(floor(gold)));
    draw_text(0,16,"wood: " + string(floor(wood)) + "/" + string(maxwood));
    draw_text(0,32,"food: " + string(floor(food)) + "/" + string(maxfood));
    draw_text(0,48,"happ: " + string(floor(happiness)));
    draw_text(0,64,"popu: " + string(floor(population)) + "/" + string(maxpop));
    draw_text(0,80,"free: " + string(unemployed) + "/" + string(floor(population)))
    draw_text(0,96,"grow: " + string(growth) + "/sec");
    draw_text(0,112,"hunger: " + string(floor(hunger)));
}
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
                draw_sprite(spr2,0,x,y);
            }  
        }
        draw_sprite(button2[10].spr,button2[10].img,button2[10].x,button2[10].y);
        break;
    case 2:
        draw_sprite(button2[10].spr,button2[10].img,button2[10].x,button2[10].y); 
        break;
}
