
--last 7 days
select * from sec_messages sm where trunc(sysdate)-trunc(sm.messdatetime) between 0 and 7

--last 15 days

select * from sec_messages sm where trunc(sysdate)-trunc(sm.messdatetime) between 0 and 15

--last week

select *
from sec_messages sm 
where trunc(sm.messdatetime) between next_day(trunc(sysdate),'MONDAY') - 14 and (next_day(trunc(sysdate),'MONDAY')) - 8

--last month 
select *
from sec_messages sm 
where trunc(sm.messdatetime) between add_months(trunc(sysdate,'mm'),-1) and last_day(add_months(trunc(sysdate,'mm'),-1))
 

--this week 
select *
from sec_messages sm 
where trunc(sm.messdatetime) between next_day(trunc(sysdate),'MONDAY') - 7 and (next_day(trunc(sysdate),'MONDAY')) - 1

--this month

select *
from sec_messages sm 
where trunc(sm.messdatetime) between trunc(sysdate,'mm') and last_day(trunc(sysdate,'mm'))

--yesterday
select  *
from sec_messages sm 
where trunc(sm.messdatetime) = trunc(sysdate)-1

