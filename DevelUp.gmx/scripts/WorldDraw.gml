
if (!surface_exists(surf_world)){
    surf_world = surface_create(7000,4300);
    surface_set_target(surf_world);
    for (i = 5; i <= gridy_size-5; i++){
        for (j = 5; j <= gridx_size-5; j++){
            var xx = GridToPosX(j,i)+3200;
            var yy = GridToPosY(j,i);
            switch(grid[j,i]){
                case 0:
                    draw_sprite(spr_water,0,xx,yy);
                    break;
                case 1:
                    draw_sprite(spr_tile,floor(random(4)),xx,yy);
                    break;
                case 2:
                    draw_sprite(spr_sand,0,xx,yy);
                    break;
            }
        }
    }
    surface_reset_target();
}
/*
if (!surface_exists(surf_world2)){
    surf_world2 = surface_create(7000,4300);
    surface_set_target(surf_world2);
    for (i = 5; i <= gridy_size-5; i++){
        for (j = 5; j <= gridx_size-5; j++){
            var xx = GridToPosX(j,i)-600;
            var yy = GridToPosY(j,i);
            switch(grid[j,i]){
                case 0:
                    draw_sprite(spr_water,0,xx,yy);
                    break;
                case 1:
                    draw_sprite(spr_tile,floor(random(4)),xx,yy);
                    break;
                case 2:
                    draw_sprite(spr_sand,0,xx,yy);
                    break;
            }
        }
    }
    surface_reset_target();
}
if (!surface_exists(surf_world3)){
    surf_world3 = surface_create(7000,4300);
    surface_set_target(surf_world3);
    for (i = 5; i <= gridy_size-5; i++){
        for (j = 5; j <= gridx_size-5; j++){
            var xx = GridToPosX(j,i)+6400;
            var yy = GridToPosY(j,i)-4300;
            switch(grid[j,i]){
                case 0:
                    draw_sprite(spr_water,0,xx,yy);
                    break;
                case 1:
                    draw_sprite(spr_tile,floor(random(4)),xx,yy);
                    break;
                case 2:
                    draw_sprite(spr_sand,0,xx,yy);
                    break;
            }
        }
    }
    surface_reset_target();
}
if (!surface_exists(surf_world4)){
    surf_world4 = surface_create(7000,4300);
    surface_set_target(surf_world4);
    for (i = 5; i <= gridy_size-5; i++){
        for (j = 5; j <= gridx_size-5; j++){
            var xx = GridToPosX(j,i)-600;
            var yy = GridToPosY(j,i)-4300;
            switch(grid[j,i]){
                case 0:
                    draw_sprite(spr_water,0,xx,yy);
                    break;
                case 1:
                    draw_sprite(spr_tile,floor(random(4)),xx,yy);
                    break;
                case 2:
                    draw_sprite(spr_sand,0,xx,yy);
                    break;
            }
        }
    }
    surface_reset_target();
}
*/
draw_surface(surf_world, -3200, 0);
/*
draw_surface(surf_world2, 600, 0);
draw_surface(surf_world3, -6400, 4300);
draw_surface(surf_world4, 600, 4300);
*/

