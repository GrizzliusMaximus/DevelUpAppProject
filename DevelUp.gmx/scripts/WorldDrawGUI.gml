var i;
draw_text(0,view_hport[0]-16,fps);
draw_text(0,view_hport[0]-32,fps_real);
draw_text(0,view_hport[0]-48,view_scale);
if (gui_state != 1){
    draw_set_color(c_white);
    draw_text(0,0,"gold: " + string(gold));
    draw_text(0,16,"wood: " + string(wood) + "/" + string(maxwood));
    draw_text(0,32,"food: " + string(food) + "/" + string(maxfood));
    draw_text(0,48,"happ: " + string(happiness));
    draw_text(0,64,"popu: " + string(population) + "/" + string(maxpop));
    draw_text(0,80,"free: " + string(unemployed) + "/" + string(population))
    draw_text(0,96,"grow: " + string(growth));
    draw_text(0,112,"hunger: " + string(hunger));
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
       
        break;
}
