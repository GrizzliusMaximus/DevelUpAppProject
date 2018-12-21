#define WorldStep
instance_activate_all();
xpos = PosToGridX(x,y);
ypos = PosToGridY(x,y);
GrowthStep();
MenuStep();
if (keyboard_check_pressed(ord('Q'))){
    surface_free(surf_world);
    /*
    surface_free(surf_world2);
    surface_free(surf_world3);
    surface_free(surf_world4);
    */
    game_restart();
}
if (keyboard_check_pressed(vk_f10)){
    game_end();
}


switch(gui_state){
    case 0: //default
       // if (TestStep()){ return 0; }
        CamControls();
        for(i = 0; i < arrbtn_size; i++){
            ButtonStep(button[i]);
        }
        break;
    case 1: //build menu
        if (ButtonStep(button2[10])){ //cancel button
            break;
        }
        if(keyboard_check_pressed(vk_escape)){
            gui_state = 0;
            sprite_index = spr_empty;
        }
        for(i = 0; i < arrbtn2_size; i++){
            ButtonStep(button2[i]);
        }
        break;
    case 2: //build drop
        CamControls();
        if (ButtonStep(button2[10])){
            break;
        }
        
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
            case 2:
                WBuildSawmill();
                break;
            case 3:
                WBuildTH();
                break;
            case 4:
                WBuildWH();
                break;
            case 5:
                WBuildWM();
                break;
            default:
                if (mouse_check_button_pressed(mb_left)){
                    instance_destroy(instance_position(GridLockX(mouse_x,mouse_y),GridLockY(mouse_x,mouse_y),all));
                    gui_state = 0;
                }  
                break;
        }
        break;
        
}
WorldActivation();
TutStep();


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
#define TutStep
if (tutactive){
    switch (tutorial){
        case 10:
            show_message("Welcome to Village Days! In this game, the goal is to populate your village (currently 90 is max). We’re going to do that by building various buildings to collect different materials. Be careful not to get yourself stuck right off the bat. To have a sustainable village, we’re going to need at least a house, farm, and sawmill.");
            break;
        case 11:
            show_message("To move arond the map, right click and drag the mouse. You can also zoom in and out using the mouse scroller.");            
            break;
        case 100:
            show_message("Let’s start off by building a house. Click on the build button and select the house. You can build it on any unoccupied land tile. Houses allow for the growth of the population. We need the people to work in other buildings soon.");
            tutactive = 0;
            break;
        case 101:
            show_message("Congratulations! You have built your first house! Each house provides 4 housing space. people will flock to your village if there is enough space and the happiness rating of your village is good.");
            break;
        case 200:
            show_message("Don't keep your villagers hungry! We’ll need to feed these people too. Build a farm from the build screen. Watch out for their growth factor. Make sure that the farm is near a lot of water to make the crops grow faster. Farms with zero growth factor will not produce any crops!");
            tutactive = 0;
            break;
        case 201:
            show_message("Good job! Your farmers will automatically plant your crops for you but it will require 5 gold pieces. When the crops are ready to be harvested, click on the farm to harvest them. You’ll gain more food and gold by doing so.");
            break;
        case 202:
            show_message("Pro tip: You can also hold the left mouse button and hover over your farms to harvest your crops. This is useful when you have a lot of farms.");
            break;
        case 300:
            show_message("Wood is another important resource to have. Build a sawmill and place it near trees. The more trees there are, the faster you can produce wood.");
            tutactive = 0;
            break;
        case 301:
            show_message("Nice one! Click on the sawmill to collect its wood. It can’t produce more when it’s full. Also, take note that the loggers will be paid for every log collected. If you do not have enough gold, the loggers will not cut more wood.");
            break;
        case 400:
            show_message("If you noticed, there’s a limit on how many buildings of the same type we can have at a certain time. In order to raise this limit, we can build a town hall once we have enough gold and wood. However, we can only have one town hall in a game.")
            break;
        case 401:
            show_message("Gather more resources by building more farms, sawmills and houses. Once you have enough resources, build a town hall.");
            tutactive = 0;
            break;
        case 402:
            show_message("Congratulations for building your town hall! You can upgrade the existing town hall to increase the limits even more (UPGRADES CURRENTLY NOT AVAILABLE). The Town hall will also unlock new buildings like warehouses (increase storage) and windmills (automatic harvest)");
            break;
        case 500:
            show_message("This conlcudes the tutorial. Try to reach the maximum population of 90 and have fun! If you want to restart on a new map, press Q on the keyboard.");
            tutactive = 0;
            break;
        case 501:
            show_message("Congratulations for reaching this far in the game!");
            tutactive = 0;
            break
    }
    tutorial++;
}
if (tutorial == 101 && buildnum[0])
    tutactive = 1;
if (tutorial == 201 && buildnum[1])
    tutactive = 1;
if (tutorial == 301 && buildnum[2])
    tutactive = 1;
if (tutorial == 402 && buildnum[3])
    tutactive = 1;
if (tutorial == 501 && population == 90)
    tutactive = 1;
