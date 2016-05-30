declare @sql nvarchar(255);
declare @sql_stmt nvarchar(255);

declare @table_schema varchar(255);
declare @table_name varchar(255);
declare @column_name varchar(255);
declare @data_type varchar(255);

declare @cnt integer;
--declare all_tables cursor forward_only for select table_catalog, table_schema, table_name, table_type from information_schema.tables;
declare all_tables cursor for select table_schema, table_name from information_schema.tables; --where table_name = 'persoon' ;


begin
  open all_tables;
  
  while 1=1 begin
    fetch next from all_tables into @table_schema, @table_name;
    if @@fetch_status < 0 break;
    
    declare all_columns cursor for select column_name, data_type from information_schema.columns  where table_schema = @table_schema and table_name = @table_name;
    open all_columns;

    while 1=1 begin
      
      --print @table_schema + ':' + @table_name;

      
      --set  @table_schema = 'dbo';
      --set  @table_name = 'actiedoor';

      fetch next from all_columns into @column_name, @data_type;
      --print @cnt;

      if @@fetch_status < 0 break;
      
      --'nvarchar', 'nchar',
      if @data_type in ('nchar','bigint','int','nvarchar') begin

        begin try
          select @sql = 'select @cnt=count(*) from ' + @table_schema + '.' + @table_name + ' where "' + @column_name + '" = ''63567156''';
          exec sp_executesql @query = @sql, @param = N'@cnt int output', @cnt=@cnt output;
          if @cnt > 0 print right('00000' + convert(varchar, @cnt), 5) + ': ' + @sql;
        end try  
        begin catch
          print 'ERROR : ' + @sql;  
        end catch;
      
      end;
      
    end;
    
    close all_columns;
    deallocate all_columns;
    
  end;
  close all_tables;
  deallocate all_tables;
end;



--select column_name, data_type from information_schema.columns  where table_schema = 'dbo' and table_name = 'actiedoor'