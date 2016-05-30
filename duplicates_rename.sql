declare
        cursor c_emp is select * from problem1;
        r_emp c_emp%ROWTYPE;
        v_sql varchar(4000);
        
begin
        open c_emp;
        loop
            fetch c_emp into r_emp;
            exit when c_emp%NOTFOUND;
            
            declare cursor c_sames is select * from problem1 where ftype = r_emp.ftype and fid <> r_emp.fid;
                                
            
            upd_counter int:=0;
            same_counter int:=1;
            r_sames c_sames%rowtype;
            
            begin   
                    
                    DBMS_OUTPUT.put_line(v_sql);
                    open c_sames;
                    loop
                         fetch c_sames into r_sames;
                         DBMS_OUTPUT.put_line(c_sames%rowcount);
                         
                         exit when c_sames%notfound;
                       
                         upd_counter:= upd_counter - 1;
                         v_sql := 'update problem1 set ftype = '||''''||trim(r_sames.ftype)||same_counter||''''||' where fid = '||r_sames.fid;
	                       DBMS_OUTPUT.put_line(v_sql);
                         execute immediate v_sql;
                         
                         same_counter := same_counter + 1;
                          
                    end loop;
           
           close c_sames;
           end;
       
       end loop;
       close c_emp;
end;








