///Growth of the population calculation and all




farmers = min(population,farmnum);
loggers = min(population-farmers,sawmillnum);
unemployed = population-farmers-loggers;

with (obj_farmland){
    if (fcount >= 100 && MouseLeftOver() && other.food <= other.maxfood-25){
        fcount = 0;
        other.food += 25;
        other.happiness += 10;
        isgrow = 0;
        image_index = 0;
    }
    if (other.farmers == 0){
        continue;
    }
    if (isgrow == 0 && other.gold >= 10){
        isgrow = 1;
        other.gold -= 10;
        other.happiness += 10;
    }
    if (isgrow){
        if (fcount < 100){
            fcount += 1/120*gfactor;
            image_index = floor(fcount/12.5);
        }
        else{
            image_index = 8;
        }
        other.farmers--;
    }
    
   
}

with (obj_sawmill){
    if (fcount >= 12.5 && MouseLeftOver() && other.wood <= other.maxwood-12.5*image_index){
        other.wood += 12.5*image_index;
        other.happiness += 12.5*image_index;
        fcount -= 12.5*image_index;
        image_index = 0;
        isgrow = 0;
    }
    if (other.loggers == 0){
        continue;
    }
    if (isgrow == 0 && other.gold >= 10){
        isgrow = 1;
        other.gold -= 10;
        other.happiness += 10;
    }
    if (isgrow){
        if (fcount < 100){
            fcount += 1/600*gfactor;
            if (floor(fcount/12.5) != image_index){
                image_index++;
                isgrow = 0;
            }
        }
        else{
            image_index = 8;
        }
        other.loggers--;
    }
}
//fcount += farmers/30;



var gg = (happiness-population*population*10-hunger*population)/120;
var pp = population/120;
if (maxpop == population && gg > 0){
    growth = 0;
    gcount = 0;
}
else{
    growth =  gg;
    gcount += growth;
}

if (gcount >= 100){
    gcount -= 100;
    population++;
}
else if (gcount <= -100 && population > 0){
    gcount += 100
    population--;
}

if (population == 0 && happiness < 100){
    happiness += 1;
}
else{
    happiness -= pp;
}

hunger += pp;

if (food > 0 && hunger > 0){
    var hh = min(food,hunger);
    happiness += hh;
    hunger -= hh;
    food -= hh;
    
    gold += hh;
    
}



