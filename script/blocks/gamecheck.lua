function main(msg)
	--[[ 【初始化】 开始]]--
	local script = blocks.getscript(19200, 5 , 19200, true);
	local x, y, z = EntityManager.GetPlayer():GetBlockPos(); -- 获取人物坐标
	--[[ 【初始化】 结束]]--
	
	--[[ 【游戏主要判定】 开始]]
	if script.gamestats==2 then	
		-- 如果游戏开始了
		 
		--[[边界
				19246 21 19232
				19196 21 19182
				
				x 19196 19246
				(script.lastx-1>=19196)
				(script.lastx+1<=19246)
				z 19182 19232
				(script.lastz-1>=19182)
				(script.lastz+1<=19232)
		]]--
		
		--[[ 【计时器】 开始]]--
		local score4=(os.time()-script.starttime) % 10;
		local score3=((os.time()-script.starttime -score4) /10 ) % 10;
		local score2=((os.time()-script.starttime - score3*10 - score4 ) /100 )%10;
		local score1=((os.time()-script.starttime - score2*100 - score3*10 - score4 ) /1000 )%10;
		cmd("/clearbag");
		cmd(string.format("/give 220%d",score1));
		cmd(string.format("/give 221%d",score2));
		cmd(string.format("/give 222%d",score3));
		cmd(string.format("/give 223%d",score4));
		--[[ 【计时器】 结束]]--
		--[[ 【脚下方块破坏器】 开始]]--
			--[[ 【破坏脚下方块】 开始]]--
			-- if (((script.mapid~=6) and (script.lasty==21)) or
				-- ((script.mapid==6) and (script.lasty>=20) and (script.lasty<=21))) and (script.DoDel==1) then
			if (script.lasty>=20) and (script.lasty<=21) and (script.DoDel==1) then
				if (script.lastx-1>=19196) and (script.lastz-1>=19182) then
					BlockEngine:SetBlock(script.lastx-1,20,script.lastz-1,0); 
					BlockEngine:SetBlock(script.lastx-1,19,script.lastz-1,0); 
				end;
				if (script.lastx-1>=19196) then
					BlockEngine:SetBlock(script.lastx-1,20,script.lastz  ,0); 
					BlockEngine:SetBlock(script.lastx-1,19,script.lastz  ,0); 
				end;
				if (script.lastx-1>=19196) and (script.lastz+1<=19232) then
					BlockEngine:SetBlock(script.lastx-1,20,script.lastz+1,0); 
					BlockEngine:SetBlock(script.lastx-1,19,script.lastz+1,0); 
				end;
				
				if (script.lastz-1>=19182) then
					BlockEngine:SetBlock(script.lastx  ,20,script.lastz-1,0);
					BlockEngine:SetBlock(script.lastx  ,19,script.lastz-1,0);
				end;
					BlockEngine:SetBlock(script.lastx  ,20,script.lastz  ,0);
					BlockEngine:SetBlock(script.lastx  ,19,script.lastz  ,0);
				if (script.lastz+1<=19232) then
					BlockEngine:SetBlock(script.lastx  ,20,script.lastz+1,0);
					BlockEngine:SetBlock(script.lastx  ,19,script.lastz+1,0);
				end;
				if (script.lastx+1<=19246) and (script.lastz-1>=19182) then
					BlockEngine:SetBlock(script.lastx+1,20,script.lastz-1,0);
					BlockEngine:SetBlock(script.lastx+1,19,script.lastz-1,0);
				end;
				if (script.lastx+1<=19246) then
					BlockEngine:SetBlock(script.lastx+1,20,script.lastz  ,0);
					BlockEngine:SetBlock(script.lastx+1,19,script.lastz  ,0);
				end;
				if (script.lastx+1<=19246) and (script.lastz+1<=19232) then
					BlockEngine:SetBlock(script.lastx+1,20,script.lastz+1,0);
					BlockEngine:SetBlock(script.lastx+1,19,script.lastz+1,0);
				end;
			end;
			--[[ 【破坏脚下方块】 结束]]--
			
			
			script.lastx=x; 
			script.lastz=z;
			script.lasty=y;
				-- 栈入本次坐标，把消除任务退到下一时刻
		--[[ 【脚下方块破坏器】 结束 ]]--
		
		--[[ 【游戏结束判定】 开始]]--
		if y<=18 then 
			script.gamestats=3;
			cmd("/tip 游戏结束");
			cmd("/addrule Player CanJump false");
			cmd(string.format("/tip 共存活%d秒",os.time()-script.starttime));
		end;
		
		--[[ 【难度控制器】 开始]]--
		-- 难度十秒递增
		local bx=0;
		local bz=0;
		if  os.time()-script.starttime  > script.diffculty*10 then 
				
					script.diffculty=script.diffculty+1;
					
					if (script.diffculty~=1) and (script.diffculty<=50)then
						if script.Sound==1 then 
							audio.play("audio/levelup.ogg");
						end;
						cmd(string.format("/tip -diffculty 游戏难度提升到Lv.%d",script.diffculty));
						for a=1,5,1 do
							bx=math.random(19196,19246);
							bz=math.random(19182,19232);
							while (BlockEngine:GetBlockId(bx,20,bz)==0) or (math.abs(bx-x)<=2) or (math.abs(bz-z)<=2)  do
								bx=math.random(19196,19246);
								bz=math.random(19182,19232);
							end;
							BlockEngine:SetBlock(bx,21,bz,script.obs[math.random(1,4)]);
							BlockEngine:SetBlock(bx,22,bz,script.obs[math.random(1,4)]);
						end;	
					end;
				
					if script.diffculty==50 then 
						cmd("/tip 难度已达到上限");
					end;
		end;
		--[[ 【难度控制器】 结束]]--
		
		
		
		--[[ 【道具控制器】 开始]]--
		
			-- 跳跃 几率 200分之1 
			if (math.random(1,200)==1) and (script.toolsJump-os.time()<=0) then
				script.toolsJump=os.time()+10;
				if script.Sound==1 then 
					audio.play('audio/JumpGet.mp3');
				end;
				cmd("/addrule Player CanJump true")
			end;
			if (script.toolsJump-os.time()<=0) then
				cmd("/addrule Player CanJump false");
				cmd("/give 2400");
			end;
			if (script.toolsJump-os.time()>0) then
				cmd(string.format("/give 2401 %d",script.toolsJump-os.time()));
			end;
			if (script.toolsJump-os.time()==2) then
				if script.Sound==1 then 
					audio.play('audio/JumpEnd.mp3');
				end;
			end;
			if (script.toolsJump-os.time()<=-2) and (script.lasty==23) then
				script.gamestats=3;
				cmd("/tip 游戏结束");
				cmd("/addrule Player CanJump false");
				cmd(string.format("/tip 共存活%d秒",os.time()-script.starttime));
				if script.Sound==1 then 
					audio.play("audio/fallbig.ogg");
				end;
				cmd("/home");
				if script.BGM==1 then 
					cmd("/music audio/TaketoriHishou.mp3");
				end;
				cmd("/time 0");
				script.mapid=0;
				cmd(string.format("/loadtemplate 19214 22 19161 tag%d",script.mapid));
				script.gamestats=0;
			end;
			
		
			---------------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			
			-- 不会掉下去 几率 400分之1 
			if (math.random(1,400)==1) and (script.toolsFloat-os.time()<=0) then
				script.toolsFloat=os.time()+10;
				if script.mapid~=6 then
					for xx=19196,19246,1 do
						for zz=19182,19232,1 do
							if BlockEngine:GetBlockId(xx,20,zz)==0 then
								BlockEngine:SetBlock(xx,20,zz,2333);
							end;
						end;
					end;
				else
					for xx=19196,19246,1 do
						for zz=19182,19232,1 do
							if BlockEngine:GetBlockId(xx,19,zz)==0 then
								BlockEngine:SetBlock(xx,19,zz,2333);
							end;
						end;
					end;
				end;
				script.floatdid=1;
				if script.Sound==1 then 
					audio.play('audio/FloatGet.mp3');
				end;
			end;
			if (script.toolsFloat-os.time()<=0) then
				if script.floatdid==1 then 
					for xx=19196,19246,1 do
						for zz=19182,19232,1 do
							if BlockEngine:GetBlockId(xx,20,zz)==2333 then
								BlockEngine:SetBlock(xx,20,zz,0);
							end;
							if BlockEngine:GetBlockId(xx,19,zz)==2333 then
								BlockEngine:SetBlock(xx,19,zz,0);
							end;
						end;
					end;
					script.floatdid=0;
				end;
				cmd("/give 2410");
			end;
			if (script.toolsFloat-os.time()>0) then
				cmd(string.format("/give 2411 %d",script.toolsFloat-os.time()));
			end;
			if (script.toolsFloat-os.time()==2) then
				if script.Sound==1 then 
					audio.play('audio/FloatEnd.mp3');
				end;
			end;
		
			---------------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			
			-- 修复附近 几率 600分之1 
			if (math.random(1,600)==1) and (script.toolsBuild-os.time()<=0) then
				script.toolsBuild=os.time()+10;
				if script.Sound==1 then 
					audio.play("audio/BuildGet.mp3");
				end;
			end;
			if (script.toolsBuild-os.time()<=0) then
				cmd("/give 2420");
			end;
			if (script.toolsBuild-os.time()>0) then
				--[[边界
						19246 21 19232
						19196 21 19182
						
						x 19196 19246
						(script.lastx-1>=19196)
						(script.lastx+1<=19246)
						z 19182 19232
						(script.lastz-1>=19182)
						(script.lastz+1<=19232)
				]]--
				xx=math.max(19196,x-2);
				xxx=math.min(19246,x+2);
				zz=math.max(19182,z-2);
				zzz=math.min(19232,z+2);
				
				for xxxx=xx,xxx,1 do
					for zzzz=zz,zzz,1 do 
						if script.mapid~=6 then
							if (BlockEngine:GetBlockId(xxxx,20,zzzz)==0) or (BlockEngine:GetBlockId(xxxx,20,zzzz)==2333) then
								BlockEngine:SetBlock(xxxx,20,zzzz,script.obs[math.random(1,4)]);
							end;
						else
							if ((BlockEngine:GetBlockId(xxxx,20,zzzz)==0) or (BlockEngine:GetBlockId(xxxx,20,zzzz)==2333)) and 
							   ((BlockEngine:GetBlockId(xxxx,19,zzzz)==0) or (BlockEngine:GetBlockId(xxxx,19,zzzz)==2333)) then
								BlockEngine:SetBlock(xxxx,19,zzzz,script.obs[math.random(1,4)]);
							end;
						end;
						for yyyy=21,30,1 do
							BlockEngine:SetBlock(xxxx,yyyy,zzzz,0);
						end;
					end;
				end;
				
				cmd(string.format("/give 2421 %d",script.toolsBuild-os.time()));
			end;
			if (script.toolsBuild-os.time()==2) then
				if script.Sound==1 then 
					audio.play("audio/BuildEnd.mp3");
				end;
			end;

		
			---------------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			---------------------------------------------------------------------------------
			
			if (script.toolsFloat-os.time()<0) and (script.toolsBuild-os.time()<0) then
				script.DoDel=1;
			else
				script.DoDel=0;
			end;
		--[[ 【道具控制器】 结束]]--
		
		
		
		
	end;

	if script.gamestats==1 then
		if y>=23 then
			script.starttime=os.time();
		else
			script.gamestats=2;
		end;
	end;
	
	if (script.gamestats==3) and (y<8) then
		-- 死亡的最后步骤
		if script.Sound==1 then 
			audio.play("audio/fallbig.ogg");
		end;
		cmd("/home");
		if script.BGM==1 then 
			cmd("/music audio/TaketoriHishou.mp3");
		end;
		cmd("/time 0");
		script.mapid=0;
		cmd(string.format("/loadtemplate 19214 22 19161 tag%d",script.mapid));
		script.gamestats=0;
	end;
	
	-- 没开始的话就要看看他有没有掉下去，如果掉下去了就把他给tp回出生点。
	-- 在我的调教的时候，这一部分会被我注释掉
	if (script.gamestats~=1) and (script.gamestats~=2) and (script.gamestats~=3) and (y<10) then
		cmd("/home");
	end;
	
	
	--[[ 【游戏主要判定】 结束]]
	
	--[[ 【反作弊】 开始]]
	if script.gamestats~=0 then
		local mode= GameLogic.GameMode:GetMode();
		if mode== 'editor' then 
				script.cheats=(script.cheats or 0) +1;
				cmd("/tip -cheat1 请遵守游戏规则，不要作弊",nil,entity);
				cmd(string.format("/tip -cheat2 累计检测作弊次数%d",script.cheats),nil,entity);
				cmd("/mode game",nil,entity);
		end;
	end;
	--[[ 【反作弊】 结束]]
	
	--[[ 【标语控制】 开始]]
	cmd("/move @start 19216 23 19162");
	cmd("/move @rule 19220 23 19162");
	cmd("/move @group 19224 23 19162");
	--[[ 【标语控制】 结束]]
	
	-- cmd("/activate 19234 2 19058");
	
	-- cmd(string.format("/echo %d",script.gamestats));
	
end