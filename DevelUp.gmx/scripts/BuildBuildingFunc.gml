var spr = argument0;
var b_mo = argument1;
var gg = argument2;
var ww = argument3;
if (gold < gg || wood < ww){
    show_message("NOT ENOUGH RESOURCES");
    exit;
}
ChangeGUIStateTo2();
build_mode = b_mo;
sprite_index = spr;
goldreq = gg;
woodreq = ww;
