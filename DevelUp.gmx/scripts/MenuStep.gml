with (obj_house){
    if (MouseRightClick()){
        show_message("House");
    }
}
with (obj_farmland){
    if (MouseRightClick()){
        show_message("Farm:#Produces crops for food.");
    }
}
with (obj_sawmill){
    if (MouseRightClick()){
        show_message("Sawmill:#Produces wood.");
    }
}
with (obj_windmill){
    if (MouseRightClick()){
        show_message("Windmill:#Auto-collects crops from nearby farms.");
    }
}
with (obj_warehouse){
    if (MouseRightClick()){
        show_message("Warehouse:#Increase capacity.#100 wood + 100 food");
    }
}

with (obj_townhall){
    if (MouseRightClick()){
        show_message("Town Hall:#increases building limit and unlocks newer buidings.");
    }
}
