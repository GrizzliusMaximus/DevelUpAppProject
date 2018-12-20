#define WorldCreate
global.world = self;
surf_world = -1;
/*USED FOR BIGGER WORLDS like 200x200
surf_world2 = -1;
surf_world3 = -1;
surf_world4 = -1;
*/
//TestCreate();
image_speed = 0;
build_mode = 0;
gui_state = 0;
view_scale = 1;
view_scaleh = view_hview[0];
view_scalew = view_wview[0];

cam_move = 0;

xprev = mouse_x;
yprev = mouse_y;

xpos = 0;
ypos = 0;

//GridCreate(100,100,46);
gridx_size = 100;
gridy_size = 100;
//GridCreate(gridx_size,gridy_size,80);
GridCreate2(gridx_size,gridy_size,80);
BuildMenuCreate();
ResourceCreate();

arrbtn_size = 1;
button[0] = instance_create(view_wport[0]-32,view_hport[0]-32,obj_button);
button[0].func = BuildButtonFunc;
button[0].spr = spr_buildbutton;

audio_channel_num(16)
audio_play_sound(bgm_1,0,1);
audio_play_sound(bgm_birds,0,1);







#define GridCreate
gridx_size = argument0;
gridy_size = argument1;
percent = argument2;
grid[gridx_size,gridy_size] = 0;
grid2[gridx_size,gridy_size] = 0;
var i, j, k, m, n;
for (i = gridy_size; i >= 0 ; i--){
    for (j = gridx_size; j >= 0; j--){
        if (random(100)>=percent*max(i/gridy_size,0.56)){
            grid[j,i] = 1;
        }
        else{
            grid[j,i] = 0;
        }
        grid2[j,i] = 0;
        
    }
}


for (k = 0; k < 3; k++){
    for (i = gridy_size; i >= 0 ; i--){
        for (j = gridx_size; j >= 0; j--){
            var tilenum = LandAdjacent(j,i);
            if (tilenum > 4){
                grid[j,i] = 1;
            }
            else if (tilenum < 4){
                grid[j,i] = 0;
            }
        }
    }
}




for (i = 0; i < gridy_size; i++){
    for (j = 0; j < gridx_size; j++){
        if (grid[j,i] == 1){
            var tilenum = LandAdjacent(j,i);
            if (tilenum - random(2) >=6){
                instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tile);
                var ran = random(4);
                if (ran>= 3){
                    grid2[j,i] = instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tree);
                }
                else if (ran >= 2.9 && tilenum == 8 && i>0 && i<gridy_size-1 && j>0 && j<gridx_size-1 ){
                    grid2[j,i] = instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_mountain);
                }
            }
            else{
                instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_sand);
            }
        }
        else{
            instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_water);
        }
        
    }
}

#define BuildMenuCreate
arrbtn2_size = 6;
var i, j;
var k = 0;


for(i = 200; i <= 2000; i += 80){
    for(j = 200; j <= 600; j += 80){
        button2[k] = instance_create(j,i,obj_button);
        k++;
        if (k > arrbtn2_size){
            break;
        }
    }
    if (k > arrbtn2_size){
        break;
    }
}

/*
for(i = 200; i <= 2000; i += 80){
    button2[k] = instance_create(200,i,obj_button);
    k++;
    if (k > arrbtn2_size){
        break;
    }
}
*/


button2[10] = instance_create(view_wport[0]-32,view_hport[0]-32,obj_button);

button2[10].func = CancelButtonFunc;
//button2[3].func = DeleteButtonFunc;
button2[5].func = WMButtonFunc;
button2[4].func = WHButtonFunc;
button2[3].func = THButtonFunc;
button2[2].func = SawmillButtonFunc;
button2[1].func = FarmButtonFunc;
button2[0].func = HouseButtonFunc;

button2[10].spr = spr_cancel;
button2[5].spr2 = spr_windmill;
button2[4].spr2 = spr_warehouse;
button2[3].spr2 = spr_townhall;
button2[2].spr2 = spr_sawmill;
button2[1].spr2 = spr_farmland;
button2[0].spr2 = spr_house;

#define LandAdjacent
j = argument0;
i = argument1;
var tilenum = 0;
var m, n;
for (m = i-1; m <= i+1; m++){
    for (n = j-1; n <= j+1; n++){
        if (n >= 0 && n <= gridx_size && m >= 0 && m <= gridy_size){
            if (m != i || n != j){
                tilenum += grid[n,m];
            }
        }
        else if (m < gridy_size/2){
            tilenum++;
        }
    }
}
return tilenum;

#define LandAdjacent2
var r = argument2;
var j = argument0-r;
var i = argument1-r;
var n = argument0 +r;
var m = argument1 +r;

var cum = argument3;

var tilenum = cum[j,i];

if (m < gridy_size){
    tilenum -= cum[j,m+1];
}

if (n < gridx_size){
    tilenum -= cum[n+1,i];
}
if (m < gridy_size && n < gridx_size){
    tilenum += cum[n+1,m+1];
}
//show_debug_message(tilenum-grid[argument0,argument1]);
return tilenum;

#define GridCreate2
gridx_size = argument0+9;
gridy_size = argument1+9;
percent = argument2;
grid[gridx_size,gridy_size] = 0;
grid2[gridx_size,gridy_size] = 0;
cum[gridx_size,gridy_size] = 0;
tcum[gridx_size,gridy_size] = 0;
var i, j, k, m, n;
for (i = gridy_size; i >= 0 ; i--){
    for (j = gridx_size; j >= 0; j--){
        if (j >= 5 && j <= gridx_size && i >= 5 && i <= gridy_size){
            if (random(100)>=80*max(i/gridy_size,0.56)){
                grid[j,i] = 1;
            }
            else{
                grid[j,i] = 0;
            }
        }
        else if (i < gridy_size/2){
            grid[j,i] = 1;
        }
        else {
            grid[j,i] = 0;
        }
        grid2[j,i] = 0;
        tgrid[j,i] = 0;
        /*
        cum[j,i] = grid[j,i];
        if (i != gridy_size){
            cum[j,i] += cum[j,i+1];
        }
        if (j != gridx_size){
            cum[j,i] += cum[j+1,i];
        }
        if (i != gridy_size && j != gridx_size){
            cum[j,i] -= cum[j+1,i+1];
        }
        */
    }
}

for (k = 0; k < 3; k++){
    for (i = gridy_size-5; i >= 5 ; i--){
        for (j = gridx_size-5; j >= 5; j--){
            var tilenum = LandAdjacent(j,i);
            //var tilenum = LandAdjacent2(j,i,2, cum);
            if (tilenum > 4){
                grid[j,i] = 1;
            }
            else if (tilenum < 4){
                grid[j,i] = 0;
            }
        }
    }
}
for (i = gridy_size; i >= 0 ; i--){
    for (j = gridx_size; j >= 0; j--){
        cum[j,i] = grid[j,i];
        if (i != gridy_size){
            cum[j,i] += cum[j,i+1];
        }
        if (j != gridx_size){
            cum[j,i] += cum[j+1,i];
        }
        if (i != gridy_size && j != gridx_size){
            cum[j,i] -= cum[j+1,i+1];
        }
    }
}




for (i = 5; i <= gridy_size-5; i++){
    for (j = 5; j <= gridx_size-5; j++){
        if (grid[j,i]){
            var tilenum = LandAdjacent2(j,i,2, cum)-(grid[j,i] > 0);
            if (tilenum - random(4) >=20){
                //instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tile);
                var ran = random(4);
                if (ran>= 3){
                    //grid2[j,i] = 
                    instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tree);
                    grid2[j,i] = 1;
                }
                else if (ran >= 2.9 && LandAdjacent2(j,i,1, cum)-(grid[j,i] > 0) == 8 && i>5 && i<gridy_size-5 && j>5 && j<gridx_size-5 ){
                    //grid2[j,i] = 
                    instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_mountain);
                    grid2[j,i] = 2;
                }
            }
            else{
                //instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_sand);
                grid[j,i] = 2;
            }
        }
        else{
            //instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_water);
        }
        
    }
}

for (i = gridy_size; i >= 0 ; i--){
    for (j = gridx_size; j >= 0; j--){
        tcum[j,i] = (grid2[j,i] == 1);
        if (i != gridy_size){
            tcum[j,i] += tcum[j,i+1];
        }
        if (j != gridx_size){
            tcum[j,i] += tcum[j+1,i];
        }
        if (i != gridy_size && j != gridx_size){
            tcum[j,i] -= tcum[j+1,i+1];
        }
    }
}

#define ResourceCreate
gold = 500;
wood = 200;
food = 0;
maxwood = 500;
happiness = 100;
population = 0;
maxpop = 0;
growth = 0;
maxfood = 500;
hunger = 0;
unemployed = 0;

housenum = 0;
housemax = 10;
housegold = 100;
housewood = 50;

townhallnum = 0;
townhallgold = 1000;
townhallwood = 450;


gcount = 0;

woodreq = 0;
goldreq = 0;

farmnum = 0;
farmers = 0;
farmmax = 20;
farmgold = 50;
farmwood = 20;

sawmillnum = 0;
loggers = 0;
sawmillmax = 10;
sawmillgold = 50;
sawmillwood =  50;

warehousenum = 0;
warehousemax = 0;
warehousegold = 500;
warehousewood = 200;

var i;
for (i = arrbtn2_size; i >= 0; i--){
    buildnum[i] = 0;
}

//windmill
buildname[5] = "Windmill";
buildgold[5] = 200;
buildwood[5] = 100;
buildspr[5] = spr_windmill;
buildmax[5] = 0;
//warehouse
buildname[4] = "Warehouse";
buildgold[4] = 500;
buildwood[4] = 200;
buildspr[4] = spr_warehouse;
buildmax[4] = 0;
//townhall
buildname[3] = "Town Hall";
buildgold[3] = 1000;
buildwood[3] = 450;
buildspr[3] = spr_townhall;
buildmax[3] = 1;
//sawmill
buildname[2] = "Sawmill";
buildgold[2] = 50;
buildwood[2] = 50;
buildspr[2] = spr_sawmill;
buildmax[2] = 10;
//farm
buildname[1] = "Farm";
buildgold[1] = 50;
buildwood[1] = 20;
buildspr[1] = spr_farmland;
buildmax[1] = 20;
//house
buildname[0] = "House";
buildgold[0] = 100;
buildwood[0] = 50;
buildspr[0] = spr_house;
buildmax[0] = 10;
