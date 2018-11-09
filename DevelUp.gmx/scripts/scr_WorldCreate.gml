mode = 0;
view_scale = 1;
view_scaleh = view_hview[0];
view_scalew = view_wview[0];
image_speed = 0;
sprite_index = spr_box;

xpos = 0;
ypos = 0;

var gridx_size = 10;
var gridy_size = 10;
grid[gridy_size,gridx_size] = 0;

var i, j;
for (i = 0; i < gridy_size; i++){
    for (j = 0; j < gridy_size; j++){
        instance_create(scr_GridToPosX(j,i),scr_GridToPosY(j,i),obj_tile);
    }
}
