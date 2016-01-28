function main(msg)
	cmd("/music audio/TaketoriHishou.mp3"); -- BGM
	
	cmd("/setblock 19235 3 19058 0");
	cmd("/setblock 19235 3 19058 189");
	-- cmd("/activate 19234 2 19058");
		-- GameLoop
	
	cmd("/lookat 19220 19 19164");
		-- 视角
		
	cmd("/addrule Player CanJump false");
	cmd("/addrule Player CanJumpInAir false");
	cmd("/addrule Player AutoWalkupBlock false");
	cmd("/addrule Player JumpUpSpeed 10");
		-- 游戏设定
		
	cmd("/maxrenderdist 1024");
		-- 最大视距
		
	cmd("/loadtemplate 19214 22 19161 tag0");
		-- 地图选择告示牌
	cmd("/tip 您可以通过点击界面左上角的两本书来切换地图或开始游戏");
	
	local script = blocks.getscript(19200, 5 , 19200, true);	
	script.mapid=0;
	script.DoDel=1;
	script.gamestats=0;
	script.BGM=1;
	script.Sound=1;
end