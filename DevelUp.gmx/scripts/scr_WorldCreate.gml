#define scr_WorldCreate
scr_TestCreate();
view_scale = 1;
view_scaleh = view_hview[0];
view_scalew = view_wview[0];

xpos = 0;
ypos = 0;

scr_GridCreate(12,12);

#define scr_GridCreate
gridx_size = argument0;
gridy_size = argument1;
grid[gridy_size,gridx_size] = 0;
var i, j;
for (i = 0; i < gridy_size; i++){
    for (j = 0; j < gridy_size; j++){
        instance_create(scr_GridToPosX(j,i),scr_GridToPosY(j,i),obj_tile);
    }
}
