var obj = BuildingDrop(obj_farmland);
if (obj){
    farmnum++;
    buildnum[1]++;
    happiness += 20;
    TakeReq();
    obj.gfactor = 25-LandAdjacent2(PosToGridX(x,y),PosToGridY(x,y),2,cum);
}
