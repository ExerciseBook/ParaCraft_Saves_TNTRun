function main(msg)
	local script = blocks.getscript(19200, 5 , 19200, true);	

	if script.gamestats==0 then
		
		
			if script.mapid==9 then 
				script.mapid=0 
			else
				script.mapid=script.mapid+1;
			end;
		
		if script.mapid==0 then
			cmd("/tip -Map 随机地图");
		end;
		if script.mapid==1 then
			cmd("/tip -Map 1栀子之殇");
		end;
		if script.mapid==2 then
			cmd("/tip -Map 2镜中藏花");
		end;
		if script.mapid==3 then
			cmd("/tip -Map 3千玄万罣");
		end;
		if script.mapid==4 then
			cmd("/tip -Map 4古老木楼");
		end;
		if script.mapid==5 then
			cmd("/tip -Map 5寒花照镜");
		end;
		if script.mapid==6 then
			cmd("/tip -Map 6论剑之擂");
		end;
		if script.mapid==7 then
			cmd("/tip -Map 7樱花之恋");
		end;
		if script.mapid==8 then
			cmd("/tip -Map 8星罗藤盘");
		end;
		if script.mapid==9 then
			cmd("/tip -Map 9幻夜苍穹");
		end;


		
		cmd(string.format("/loadtemplate 19214 22 19161 tag%d",script.mapid));
	end;
end