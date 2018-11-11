#define WorldCreate
//TestCreate();
image_speed = 0;
build_mode = 0;
gui_state = 0;
view_scale = 1;
view_scaleh = view_hview[0];
view_scalew = view_wview[0];

xpos = 0;
ypos = 0;

GridCreate(12,12);
BuildMenuCreate();

arrbtn_size = 1;
button[0] = instance_create(736,416,obj_button);
button[0].func = BuildButtonFunc;



#define GridCreate
gridx_size = argument0;
gridy_size = argument1;
grid[gridx_size,gridy_size] = 0;
var i, j;
for (i = 0; i < gridy_size; i++){
    for (j = 0; j < gridx_size; j++){
        grid[j,i] = instance_create(GridToPosX(j,i),GridToPosY(j,i),obj_tile);
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
button2[1].func = TileButtonFunc;
button2[0].func = HouseButtonFunc;

