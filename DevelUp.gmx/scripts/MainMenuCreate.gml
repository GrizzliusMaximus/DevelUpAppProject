#define MainMenuCreate
start = instance_create(550,360,obj_button);
quit = instance_create(550,400,obj_button);
start.spr = spr_buttonsmall;
quit.spr = spr_buttonsmall;
start.spr2 = spr_start;
quit.spr2 = spr_quit;
start.func = StartFunc;
quit.func = QuitFunc;
audio_play_sound(bgm_title,0,1);


#define MainMenuStep
ButtonStep(start);
ButtonStep(quit);

#define MainMenuDraw
with(start){
    draw_sprite(spr,img,x,y);
    draw_sprite(spr2,0,x,y+8);
}
with(quit){
    draw_sprite(spr,img,x,y);
    draw_sprite(spr2,0,x,y+8);
}

#define StartFunc
room_goto_next();
audio_stop_all();

#define QuitFunc
game_end();
