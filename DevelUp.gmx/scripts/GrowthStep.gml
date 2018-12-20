///Growth of the population calculation and all



var pop = floor(population);
farmers = min(pop,farmnum);
loggers = min(pop-farmers,sawmillnum);
unemployed = pop-farmers-loggers;

with (obj_farmland){
    if (fcount >= 100 && MouseLeftOver() && other.food <= other.maxfood-25){
        fcount = 0;
        other.food += 25;
        other.happiness += 10;
        isgrow = 0;
        image_index = 0;
        audio_play_sound(sou_collect,0,0);
    }
    if (other.farmers == 0){
        farmers = 0;
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
        farmers = 1;
        other.farmers--;
    }
    
   
}

with (obj_sawmill){
    if (MouseLeftOver()){
        while(fcount >= 6.25 && other.wood <= other.maxwood-6.25){
            other.wood += 6.25;
            other.happiness += 6.25;
            fcount -= 6.25;
            isgrow = 0;
            image_index = floor(fcount/6.25);
            audio_play_sound(sou_collect,0,0);
        }
    }
    if (other.loggers == 0){
        logger = 0;
        continue;
    }
    if (isgrow == 0 && other.gold >= 5){
        isgrow = 1;
        other.gold -= 5;
        other.happiness += 5;
    }
    if (isgrow){
        if (fcount < 100){
            fcount += 1/600*gfactor;
            if (floor(fcount/6.25) != image_index){
                image_index++;
                isgrow = 0;
            }
        }
        else{
            image_index = 16;
        }
        logger = 1;
        other.loggers--;
    }
}

/*
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
*/

var oldpop = population;
population +=  (sqrt((happiness-hunger*population)/10)-population)/120;
population = min(maxpop,population);
growth = (population-oldpop)*60;
var pp = pop/120;

if (pop == 0 && happiness < 100){
    //happiness += 1;
    show_message("Get Better Scrub");
    game_restart();
}
else{
    happiness -= pp;
}

hunger += pp;

if (food > 0 && hunger > 0){
    var hh = min(food,pp*2);
    happiness += hh;
    hunger -= hh;
    food -= hh;
    
    gold += hh;
    if (hunger < 0){
        hunger = 0;
    }
    
}



