SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE function [sasload].[userLabel](@string varchar(8000)) returns varchar(8000) as
begin

declare @newstring varchar(8000)
declare @i int
declare @inlen int
declare @thischar char(1)
declare @lowcasea int

set @lowcasea =  ascii('a')

set @inlen = DATALENGTH(@string)
set @newstring = substring(@string, 1, 1)
set @i=1
while (@i < @inlen)
begin
	set @i = @i + 1
    set @thischar = substring(@string, @i, 1)
	if (ascii(@thischar) >= @lowcasea)
	   begin
	      set @newstring = @newstring + @thischar
	   end
	else 
	begin
		  set @newstring = @newstring + ' ' + @thischar
	end
end

return @newstring
end


GO
