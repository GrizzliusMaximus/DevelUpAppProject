var obj = BuildingDrop(obj_farmland);
if (obj){
    farmnum++;
    happiness += 20;
    TakeReq();
    obj.gfactor = 24-LandAdjacent2(PosToGridX(x,y),PosToGridY(x,y),2,cum);
}
