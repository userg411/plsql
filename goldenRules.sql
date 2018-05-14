if object_id('getGoldenRules') is not NULL
   DROP FUNCTION getGoldenRules
GO

CREATE FUNCTION dbo.getGoldenRules(@num int)
RETURNS varchar(2000) 
AS 
BEGIN
	declare @curPow int = 1
	declare @rule varchar(200) = ''
	declare @rules varchar(2000) = ''
	
	if(@num = 4096)
		set @rules = 'Not Applicable'
	else 
	begin 	
		while @curPow<4096
		begin
			if((@curPow&@num)!=0)
			begin
				select @rule = case @curPow
									when 1    then 'Rule1'
									when 2    then 'Rule2'
									when 4    then 'Rule3'
									when 8    then 'Rule4'
									when 16   then 'Rule5'
									when 32   then 'Rule6'
									when 64	  then 'Rule7'
									when 128  then 'Rule8'
									when 256  then 'Rule9'
									when 512  then 'Rule10'
									when 1024 then 'Rule11'
									when 2048 then 'Rule12'
							   end
				set @rules  = @rules + ' ' + @rule + ', '
			end;
			set @curPow = @curPow*2;
		end;
	end;	
	RETURN ltrim(substring(@rules,1,len(@rules)-1))
END;
GO
SELECT dbo.getGoldenRules(1) AS MyResult 
