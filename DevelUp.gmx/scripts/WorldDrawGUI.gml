var i;


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
            }  
        }
        break;
}
