with (obj_house){
    if (MouseRightClick()){
        show_message("House");
    }
}
with (obj_farmland){
    if (MouseRightClick()){
        show_message("Farmers: " + string(farmers));
    }
}
with (obj_sawmill){
    if (MouseRightClick()){
        show_message("loggers:" + string(logger));
    }
}
with (obj_warehouse){
    if (MouseRightClick()){
        show_message("Warehouse capacity: 100 wood + 100 food");
    }
}

with (obj_townhall){
    if (MouseRightClick()){
        show_message("Town Hall");
    }
}
