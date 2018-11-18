#define WorldStep
instance_activate_all();
xpos = PosToGridX(x,y);
ypos = PosToGridY(x,y);
GrowthStep();
if (keyboard_check_pressed(ord('Q'))){
    game_restart();
}
if (keyboard_check_pressed(vk_f10)){
    game_end();
}


switch(gui_state){
    case 0:
       // if (TestStep()){ return 0; }
        CamControls();
        for(i = 0; i < arrbtn_size; i++){
            ButtonStep(button[i]);
        }
        break;
    case 1:
        if(keyboard_check_pressed(vk_escape)){
            gui_state = 0;
            sprite_index = spr_empty;
        }
        for(i = 0; i < arrbtn2_size; i++){
            ButtonStep(button2[i]);
        }
        break;
    case 2:
        if(keyboard_check_pressed(vk_escape)){
            gui_state = 0;
            sprite_index = spr_empty;
        }
        switch(build_mode){
            case 0:
                WBuildHouse();
                break;
            case 1:
                WBuildFarm();
                break;
            default:
                if (mouse_check_button_pressed(mb_left)){
                    instance_destroy(instance_position(GridLockX(mouse_x,mouse_y),GridLockY(mouse_x,mouse_y),all));
                    gui_state = 0;
                }  
                break;
        }
        CamControls();
        break;
        
}
WorldActivation();


#define WorldActivation
if (view_scale >= 4){
    exit;
}
instance_deactivate_region(view_xview[0] - 256*view_scale, view_yview[0] - 256*view_scale, view_wview[0] + 256*view_scale, view_hview[0] + 256*view_scale, false,true);
var i;
for (i = 0; i < arrbtn_size; i++){
    instance_activate_object(button[i]);
}
for (i = 0; i < arrbtn2_size; i++){
    instance_activate_object(button2[i]);
}


#define ResetReq
goldreq = 0;
woodreq = 0;

#define TakeReq
gold -= goldreq;
wood -= woodreq;
ResetReq();

#define WBuildHouse
if (BuildingDrop(obj_house)){
    maxpop += 4;
    happiness += 50;
    TakeReq();
}

#define WBuildFarm
var obj = BuildingDrop(obj_farmland);
if (obj){
    farmnum++;
    happiness += 20;
    TakeReq();
    obj.gfactor = 24-LandAdjacent2(PosToGridX(x,y),PosToGridY(x,y),2,cum);
}

#define GrowthStep
///Growth of the population calculation and all

farmers = min(population,farmnum);

with (obj_farmland){
    if (other.farmers == 0){
        break;
    }
    if (isgrow == 0 && other.gold >= 10){
        isgrow = 1;
        other.gold -= 10;
        other.happiness += 10;
    }
    if (isgrow){
        if (fcount < 100){
            fcount += 1/120*gfactor;
            image_index = floor(fcount/12.5);
        }
        else{
            image_index = 8;
        }
        if (fcount >= 100 && PosToGridX(mouse_x,mouse_y) == PosToGridX(x,y) && PosToGridY(mouse_x,mouse_y) == PosToGridY(x,y) && mouse_check_button(mb_left)){
            fcount = 0;
            other.food += 25;
            other.happiness += 10;
            isgrow = 0;
            image_index = 0;
        }
        other.farmers--;
    }
    
   
}
//fcount += farmers/30;



var gg = (happiness-population*population*10-hunger*population)/120;
var pp = population/120;
if (maxpop == population && gg > 0){
    growth = 0;
    gcount = 0;
}
else{
    growth =  gg;
    gcount += growth;
}

if (gcount >= 100){
    gcount -= 100;
    population++;
}
else if (gcount <= -100 && population > 0){
    gcount += 100
    population--;
}

if (population == 0 && happiness < 100){
    happiness += 1;
}
else{
    happiness -= pp;
}

hunger += pp;

if (food > 0 && hunger > 0){
    var hh = min(food/20,hunger);
    happiness += hh;
    hunger -= hh;
    food -= hh;
    
    gold += hh;
    
}




