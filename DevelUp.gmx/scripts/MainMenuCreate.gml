#define MainMenuCreate
start = instance_create(200,550,obj_button);
credits = instance_create(550,550,obj_button);
quit = instance_create(900,550,obj_button);
start.spr = spr_start2;
quit.spr = spr_quit2;
credits.spr = spr_credits;
//start.spr2 = spr_start;
//quit.spr2 = spr_quit;
start.func = StartFunc;
credits.func = CreditFunc;
quit.func = QuitFunc;
audio_play_sound(bgm_title,0,1);


#define MainMenuStep
ButtonStep(start);
ButtonStep(credits);
ButtonStep(quit);

#define MainMenuDraw
with(start){
    draw_sprite(spr,img,x,y);
    //draw_sprite(spr2,0,x,y+8);
}
with(quit){
    draw_sprite(spr,img,x,y);
    //draw_sprite(spr2,0,x,y+8);
}
with(credits){
    draw_sprite(spr,img,x,y);
    //draw_sprite(spr2,0,x,y+8);
}

#define StartFunc
room_goto_next();
audio_stop_all();

#define QuitFunc
game_end();
#define CreditFunc
show_message("Game Developed by:##Isaiah Dy-Liacco - Artist#Neil Hernandez - Pixel Artist#Chico Perez - Programmer");
