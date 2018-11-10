#define CamControls
x = mouse_x;
y = mouse_y;
if (CamMovement()) { return 0; }
CamZoom();

#define CamMovement
if (mouse_check_button_pressed(mb_left)){
    xprev = mouse_x;
    yprev = mouse_y;
}
else if (mouse_check_button(mb_left)){
    view_xview[0] -= mouse_x-xprev;
    view_yview[0] -= mouse_y-yprev;
    return 1;
}
return 0;

#define CamZoom
var xdiff = mouse_x-view_xview[0];
var ydiff = mouse_y-view_yview[0];

if (mouse_wheel_down() && view_scale < 2){
    view_scalew*=1.2;
    view_scaleh*=1.2;
    view_scale *= 1.2;
}
else if (mouse_wheel_up()&& view_scale > 0.5){
    view_scalew/=1.2;
    view_scaleh/=1.2;
    view_scale /= 1.2;
}
var vieww_old= view_wview[0];
view_wview[0] += round((view_scalew-view_wview[0])/2);
var viewh_old= view_hview[0];
view_hview[0] += round((view_scaleh-view_hview[0])/2) ;
view_xview[0] = mouse_x - xdiff*(view_wview[0]/vieww_old);
view_yview[0] = mouse_y - ydiff*(view_hview[0]/viewh_old);
