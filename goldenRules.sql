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
									when 1    then 'Driving Safety'
									when 2    then 'Management of Change'
									when 4    then 'Lifting Operations'
									when 8    then 'Fire Safety'
									when 16   then 'Working at Height'
									when 32   then 'Energyzed Systems'
									when 64	  then 'Excavation Safety'
									when 128  then 'Permit of Work'
									when 256  then 'Health Management'
									when 512  then 'Personal Protective Equipment'
									when 1024 then 'Hydrogen Sulphide'
									when 2048 then 'Confined Space'
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
