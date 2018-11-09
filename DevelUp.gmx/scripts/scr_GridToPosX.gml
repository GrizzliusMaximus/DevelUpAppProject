#define scr_GridToPosX
var xx = argument0;
var yy = argument1;


return 400 + xx*48 - yy*48;

#define scr_GridToPosY
var xx = argument0;
var yy = argument1;


return 144 + xx*16 + yy*16;

#define scr_PostoGridX
var xx = argument0;
var yy = argument1;


return (x-832+3*y)/96;

#define scr_PostoGridY
var xx = argument0;
var yy = argument1;


return (-x+3*y-32)/96;