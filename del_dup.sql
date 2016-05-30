DELETE FROM 
   xx_message_agg_day A
WHERE 
  a.rowid > 
   ANY (
     SELECT 
        B.rowid
     FROM 
        xx_message_agg_day B
     WHERE 
        A.Cardnumber = B.Cardnumber
     AND 
        A.Fcardholderid = B.FCARDHOLDERID
        and A.Day = B.Day
        and A.Daystart = B.Daystart
        );
        
        
        select * from xx_message_agg_day
