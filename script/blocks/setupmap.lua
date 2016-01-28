function main(msg)

	local script = blocks.getscript(19200, 5 , 19200, true);
	
	if script.gamestats==0 then
			
		script.obs= {139,81,140,138};
				--[[
					--旧版色彩冲击版本
				
					local blocks = {19,21,23,25,71,94,133,137};
				
					-- 羊毛们拟好
					for x=19200,19249,1 do
						for z=19200,19249,1 do
							BlockEngine:SetBlock(x,101,z,blocks[math.random(1,8)]);
							-- 出来吧！我的羊毛
						end;
					end;
				
				]]--
				
				
				for x=19196,19246,1 do
					for z=19182,19232,1 do
						BlockEngine:SetBlock(x,30,z,0);
						BlockEngine:SetBlock(x,29,z,0);
						BlockEngine:SetBlock(x,28,z,0);
						BlockEngine:SetBlock(x,27,z,0);
						BlockEngine:SetBlock(x,26,z,0);
						BlockEngine:SetBlock(x,25,z,0);
						BlockEngine:SetBlock(x,24,z,0);
						BlockEngine:SetBlock(x,23,z,0);
						BlockEngine:SetBlock(x,22,z,0);
						BlockEngine:SetBlock(x,21,z,0);
						BlockEngine:SetBlock(x,20,z,0);
						BlockEngine:SetBlock(x,19,z,0);
					end;
				end;
				-- 清理犯罪现场
				
				
				-- 生成地图
				local a=script.mapid
					-- a=100 即无自定义选择地图
				if a==0 then 
					a=math.random(1,9);
					script.mapid=a;
				end;
				
				if a==1 then
					-- 栀子之殇
					cmd("/loadtemplate 19221 20 19207 1");
					cmd("/tip 【栀子之殇】");
					-- cmd("/tip 地图作者【大触手·小寂】");
					if script.BGM==1 then
						cmd("/music audio/sayonarakiminokoe.mp3");
					end;
				end;
				if a==2 then
					-- 镜中藏花
					if math.random(1,2)==1 then
						cmd("/loadtemplate 19221 20 19207 2")
					else
						cmd("/loadtemplate 19221 20 19207 2.1")
					end;
					
					cmd("/tip 【镜中藏花】");
					-- cmd("/tip 地图作者【魔性设计师·Eric】");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				if a==3 then
					-- 千玄万罣
					cmd("/loadtemplate 19221 20 19207 3");
					cmd("/tip 【千玄万罣】");
					-- cmd("/tip 地图作者【萌小新·沧海】");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				if a==4 then 
					-- 古老木楼
					for x=19196,19246,1 do
						for z=19182,19232,1 do
							BlockEngine:SetBlock(x,20,z,script.obs[math.random(1,4)]);
						end;
					end;
					-- cmd("/tip 地图作者【你人品的化身·古老木楼】");
					cmd("/tip 【古老木楼】");
					cmd("/tip 小心脚下，随时塌方");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				if a==5 then
					-- 寒花照镜
					cmd("/loadtemplate 19221 20 19207 5");
					cmd("/tip 【寒花照镜】");
					-- cmd("/tip 地图作者【魔性雕花者·暮雨】");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				if a==6 then
					-- 【论剑之擂】
					cmd("/loadtemplate 19221 19 19207 6");
					cmd("/tip 【论剑之擂】");
					-- cmd("/tip 地图作者【专业作死者·桌子】");
					cmd("/tip 本地图难度较高");
					cmd("/tip 做好准备");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				if a==7 then 
					-- 樱花之恋
					script.obs= {2301,2302,2303,2304,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305,
								 2305,2305,2305,2305,2305};
					for x=19196,19246,1 do
						for z=19182,19232,1 do
							BlockEngine:SetBlock(x,20,z,script.obs[math.random(1,50)]);
						end;
					end;
					cmd("/tip 【樱花之恋】");
					-- cmd("/tip 地图作者【你人品的化身·樱花之恋】");
					cmd("/tip 别踩坏了那些花朵");
					if script.BGM==1 then
						cmd("/music audio/KoiYomiZakura.mp3");
					end;
					
					cmd("/time 1");
					script.obs= {2301,2302,2303,2304};
				end;
				if a==8 then
					-- 星罗藤盘
					cmd("/loadtemplate 19221 20 19207 8");
					cmd("/tip 【星罗藤盘】");
					-- cmd("/tip 地图作者【数学学霸·慕白 × 作死者·桌子】");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				if a==9 then
					-- 星罗藤盘
					cmd("/loadtemplate 19221 20 19207 9");
					cmd("/tip 【幻夜苍穹】");
					-- cmd("/tip 地图作者【数学学霸·慕白】");
					if script.BGM==1 then
						cmd("/music audio/AiAe.mp3");
					end;
				end;
				
				
				
				cmd("/goto 19221 100 19207");
				cmd("/addrule Player CanJump false")
				cmd("/addrule Player CanJumpInAir false");
				cmd("/addrule Player AutoWalkupBlock false");
				-- 初始化游戏规则
				
				script.score=0;
				cmd("/mode game");
				cmd("/clearbag");
				script.gamestats=1;
				script.lastx=0;
				script.lastz=0;
				script.starttime=os.time();
				script.diffculty=0;
				script.toolsJump=os.time();
				script.toolsFloat=os.time();
				script.toolsBuild=os.time();
				script.DoDel=1;
				script.lastx=19221;
				script.lasty=100;
				script.lastz=19207;
				cmd('/give 2200');
				cmd('/give 2210');
				cmd('/give 2220');
				cmd('/give 2230');
				cmd('/give 2400');
				cmd('/give 2410');
				cmd('/give 2420');
				-- 初始化游戏内容
				
	end;
end