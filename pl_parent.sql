select * from xx_serik t where t.v_wbs_level = 8
select * from xx_serik t where t.c_parent_wbs  = '3A'

select * from xx_serik_clean order by v_wbs_level asc
where t.c_wbs <>t.c_parent_wbs

select max(v_wbs_level) from xx_serik

CREATE TABLE xx_serik_flat  
( wbs varchar2(50) NULL,
  level1 varchar2(50) NULL,
  level2 varchar2(50) NULL,
  level3 varchar2(50) NULL,
  level4 varchar2(50) NULL,  
  level5 varchar2(50) NULL,
  level6 varchar2(50) NULL,
  level7 varchar2(50) NULL,
  level8 varchar2(50) NULL
); 

select * from xx_serik_flat 

begin
FOR Lcntr IN 1..20
LOOP
   dbms_output.put_line(Lcntr);
END LOOP;
end;


select * from xx_serik_flat
select * from xx_serik t  where t.v_wbs_level = 2
--level1
insert into xx_serik_flat 
select t.c_wbs,t.s_wbs, '', '', '', '','','',''  from xx_serik t  
where t.v_wbs_level = 1

--level2

insert into xx_serik_flat 
select t.c_wbs,s_f.level1, t.s_wbs, '', '', '','','','' 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 2
and t.c_parent_wbs = s_f.wbs

--level3
insert into xx_serik_flat 
select t.c_wbs,s_f.level1,s_f.level2 , t.s_wbs, '', '','','','' 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 3
and t.c_parent_wbs = s_f.wbs
--level4
insert into xx_serik_flat 
select t.c_wbs,s_f.level1,s_f.level2 ,s_f.level3 , t.s_wbs, '','','','' 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 4
and t.c_parent_wbs = s_f.wbs

--level5
insert into xx_serik_flat 
select t.c_wbs,s_f.level1,s_f.level2 ,s_f.level3 , s_f.level4,t.s_wbs, '','','' 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 5
and t.c_parent_wbs = s_f.wbs

--level6
insert into xx_serik_flat 
select t.c_wbs,s_f.level1,s_f.level2 ,s_f.level3 , s_f.level4,s_f.level5,t.s_wbs, '','' 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 6
and t.c_parent_wbs = s_f.wbs

--level7
insert into xx_serik_flat 
select t.c_wbs,s_f.level1,s_f.level2 ,s_f.level3 , s_f.level4,s_f.level5,s_f.level6,t.s_wbs, '' 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 7
and t.c_parent_wbs = s_f.wbs

--level8
insert into xx_serik_flat 
select t.c_wbs,s_f.level1,s_f.level2 ,s_f.level3 , s_f.level4,s_f.level5,s_f.level6,s_f.level7,t.s_wbs 

from xx_serik t, xx_serik_flat s_f

where t.v_wbs_level = 8
and t.c_parent_wbs = s_f.wbs






begin
FOR Lcntr IN 2..8
LOOP
    insert into xx_serik_flat 
    select t.c_wbs,s_f.level1,s_f.level2 ,s_f.level3 , s_f.level4,s_f.level5,s_f.level6,s_f.level7,t.s_wbs 
    from xx_serik t, xx_serik_flat s_f
    where t.v_wbs_level = 8
    and t.c_parent_wbs = s_f.wbs
    
END LOOP;
end;


























