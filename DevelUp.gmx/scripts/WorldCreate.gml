#define WorldCreate
global.world = self;
//TestCreate();
image_speed = 0;
build_mode = 0;
gui_state = 0;
view_scale = 1;
view_scaleh = view_hview[0];
view_scalew = view_wview[0];

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
arrbtn2_size = 3;
var i, j;
var k = 0;

for(i = 100; i <= 180; i += 80){
    for(j = 100; j <= 500; j += 80){
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

button2[2].func = DeleteButtonFunc;
button2[1].func = FarmButtonFunc;
button2[0].func = HouseButtonFunc;

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
return tilenum-grid[argument0,argument1];

#define GridCreate2
gridx_size = argument0+9;
gridy_size = argument1+9;
percent = argument2;
grid[gridx_size,gridy_size] = 0;
grid2[gridx_size,gridy_size] = 0;
cum[gridx_size,gridy_size] = 0;
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
        if (grid[j,i] == 1){
            var tilenum = LandAdjacent2(j,i,2, cum);
            if (tilenum - random(4) >=20){
                instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tile);
                var ran = random(4);
                if (ran>= 3){
                    grid2[j,i] = instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tree);
                }
                else if (ran >= 2.9 && LandAdjacent2(j,i,1, cum) == 8 && i>5 && i<gridy_size-5 && j>5 && j<gridx_size-5 ){
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

#define ResourceCreate
gold = 1000;
wood = 1000;
food = 0;
happiness = 100;
population = 0;
maxpop = 0;
growth = 0;
maxfood = 500;
hunger = 0;

gcount = 0;

woodreq = 0;
goldreq = 0;

farmnum = 0;
fcount = 0;
farmers = 0;
