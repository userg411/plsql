
create table  xx_exit_gates
as
select  replace(replace(replace(replace(a.labelIn, 'Entry',''),'In',''),'IN',''),'ENTRY','') b , m.objectlabel


from 
(select distinct g.objectlabel labelIn from  xx_entry_gates g where upper(g.objectlabel) like '%ENTRY' or upper(g.objectlabel) like '%IN')a 
join fct_messages m
on replace(replace(replace(replace(a.labelIn, 'Entry',''),'In',''),'IN',''),'ENTRY','') = m.objectlabel




select distinct  g.objectlabel from xx_exit_gates g
