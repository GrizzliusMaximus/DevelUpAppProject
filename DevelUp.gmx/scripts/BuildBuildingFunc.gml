
var b_mo = argument0;
var spr = buildspr[b_mo];
var gg = buildgold[b_mo];
var ww = buildwood[b_mo];
if (gold < gg || wood < ww){
    show_message("NOT ENOUGH RESOURCES");
    exit;
}
ChangeGUIStateTo2();
build_mode = b_mo;
sprite_index = spr;
goldreq = gg;
woodreq = ww;
