if (BuildingDrop(obj_townhall)){
    maxpop += 10;
    happiness += 100;
    
    townhallnum++;
    buildnum[3]++;
    
    farmmax += 10;
    sawmillmax += 10;
    housemax += 10;
    buildmax[1]+= 10;
    buildmax[2]+= 10;
    buildmax[0]+= 10;
    TakeReq();
}
