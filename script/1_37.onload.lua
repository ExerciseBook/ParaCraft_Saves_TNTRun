local sceneLoader = ParaScene.GetObject("<managed_loader>1_37.onload.lua");
if (sceneLoader:IsValid() == true) then 
	ParaScene.Attach(sceneLoader);
	return
end
sceneLoader = ParaScene.CreateManagedLoader("1_37.onload.lua");
local player, asset, playerChar,att;
local cpmesh=ParaScene.CreateMeshPhysicsObject;
ParaScene.Attach(sceneLoader);
