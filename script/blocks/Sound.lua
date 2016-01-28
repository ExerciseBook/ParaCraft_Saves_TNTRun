function main(msg)
	local script = blocks.getscript(19200, 5 , 19200, true);	
	if script.Sound==1 then
		script.Sound=0;
		BlockEngine:SetBlock(19232,22,19162,199);
		cmd("/tip -Sound 关闭音效");
	else
		script.Sound=1;
		BlockEngine:SetBlock(19232,22,19162,6);
		cmd("/tip -Sound 开启音效");
	end;
end