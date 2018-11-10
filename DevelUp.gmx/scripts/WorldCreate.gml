#define WorldCreate
TestCreate();
view_scale = 1;
view_scaleh = view_hview[0];
view_scalew = view_wview[0];

xpos = 0;
ypos = 0;

GridCreate(12,12);

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
