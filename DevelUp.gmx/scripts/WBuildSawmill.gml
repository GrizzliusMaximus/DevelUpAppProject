var obj = BuildingDrop(obj_sawmill);
if (obj){
    sawmillnum++;
    buildnum[2]++;
    happiness += 20;
    TakeReq();
    obj.gfactor = LandAdjacent2(PosToGridX(x,y),PosToGridY(x,y),2,tcum);
}
