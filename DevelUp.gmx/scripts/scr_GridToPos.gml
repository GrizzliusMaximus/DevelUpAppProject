#define scr_GridToPos
///grid to pos / pos to grid

#define scr_GridToPosX
var xx = argument0;
var yy = argument1;


return 400 + xx*32 - yy*32;

#define scr_GridToPosY
var xx = argument0;
var yy = argument1;


return 144 + xx*16 + yy*16;

#define scr_PostoGridX
var xx = argument0;
var yy = argument1;


return round((x-688+2*y)/64);

#define scr_PostoGridY
var xx = argument0;
var yy = argument1;


return round((-x+2*y+112)/64);
