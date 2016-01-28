function main(msg)
	local script = blocks.getscript(19200, 5 , 19200, true);	
	-- script.BGM=1;
	if script.BGM==1 then
		script.BGM=0;
		cmd("/music");
		BlockEngine:SetBlock(19228,22,19162,199);
		cmd("/tip -BGM 关闭音乐");
	else
		script.BGM=1;
		BlockEngine:SetBlock(19228,22,19162,6);
		cmd("/tip -BGM 开启音乐");
	end;
end