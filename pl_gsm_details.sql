select 
       k.gsm
     , k.period_invoice
     
     , sum(decode(k.type_of_call_v, '0', k.cost_of_call, 0)) as "0"
     , sum(decode(k.type_of_call_v, '0', k.duration_n, 0)) as "0 Duration"
      
     , sum(decode(k.type_of_call_v, '1', k.cost_of_call, 0)) as "1"
     , sum(decode(k.type_of_call_v, '1', k.duration_n, 0)) as "1 Duration"
     
     , sum(decode(k.type_of_call_v, '2', k.cost_of_call, 0)) as "2"
     , sum(decode(k.type_of_call_v, '2', k.duration_n, 0)) as "2 Duration"
     
     , sum(decode(k.type_of_call_v, '3', k.cost_of_call, 0)) as "3"
     , sum(decode(k.type_of_call_v, '3', k.duration_n, 0)) as "3 Duration"
     
     , sum(decode(k.type_of_call_v, '4', k.cost_of_call, 0))as "4"
     , sum(decode(k.type_of_call_v, '4', k.duration_n, 0))as "4 Duration"
          
     , sum(decode(k.type_of_call_v, '5', k.cost_of_call, 0)) as "5"
     , sum(decode(k.type_of_call_v, '5', k.duration_n, 0)) as "5 Duration"
     
     , sum(decode(k.type_of_call_v, '15', k.cost_of_call, 0)) as "15"
     , sum(decode(k.type_of_call_v, '15', k.duration_n, 0)) as "15 Duration"
     
     , sum(decode(k.type_of_call_v, '41', k.cost_of_call, 0)) as "41"
     , sum(decode(k.type_of_call_v, '41', k.duration_n, 0)) as "41 Duration "
     
     , sum(decode(k.type_of_call_v, '42', k.cost_of_call, 0)) as "42"
     , sum(decode(k.type_of_call_v, '42', k.duration_n, 0)) as "42 Duration "
     
     , sum(decode(k.type_of_call_v, '45', k.cost_of_call, 0)) as "45"
     , sum(decode(k.type_of_call_v, '45', k.duration_n, 0)) as "45 Duration "
     
     , sum(decode(k.type_of_call_v, '55', k.cost_of_call, 0)) as "55"
     , sum(decode(k.type_of_call_v, '55', k.duration_n, 0)) as "55 Duration"
     
     , sum(decode(k.type_of_call_v, '56', k.cost_of_call, 0)) as "56" 
      , sum(decode(k.type_of_call_v, '56',k.duration_n, 0)) as "56 Duration"     
 
     , sum(decode(k.type_of_call_v, '57', k.cost_of_call, 0)) as "57"
     , sum(decode(k.type_of_call_v, '57', k.duration_n, 0)) as "57 Duration"
     
     , sum(decode(k.type_of_call_v, '58', k.cost_of_call, 0)) as "58"
     , sum(decode(k.type_of_call_v, '58', k.duration_n, 0)) as "58 Duration"
     
     , sum(decode(k.type_of_call_v, '81', k.cost_of_call, 0)) as "81"
     , sum(decode(k.type_of_call_v, '81', k.duration_n, 0)) as "81 Duration"
     
     , sum(decode(k.type_of_call_v,'0', k.cost_of_call, 
                                   '1',k.cost_of_call,
                                   '2',k.cost_of_call,
                                   '3',k.cost_of_call,
                                   '4',k.cost_of_call,
                                   '5',k.cost_of_call,
                                   '15',k.cost_of_call,                         
                                   '41',k.cost_of_call,
                                   '42',k.cost_of_call,
                                   '45',k.cost_of_call,
                                   '55',k.cost_of_call,
                                   '56',k.cost_of_call,
                                   '57',k.cost_of_call,
                                   '58',k.cost_of_call,
                                   '81',k.cost_of_call,0)) as "Total Local Amount" 
                                   
      , sum(decode(k.type_of_call_v,'0', k.duration_n, 
                                    '1',k.duration_n,
                                    '2',k.duration_n,
                                    '3',k.duration_n,
                                    '4',k.duration_n,
                                    '5',k.duration_n,
                                    '15',k.duration_n,                         
                                    '41',k.duration_n,
                                    '42',k.duration_n,
                                    '45',k.duration_n,
                                    '55',k.duration_n,
                                    '56',k.duration_n,
                                    '57',k.duration_n,
                                    '58',k.duration_n,
                                    '81',k.duration_n,0)) as "Total Local Duration"                                                                                                                       
     , sum(decode(k.type_of_call_v, '77', k.cost_of_call, 0)) as "77"
     , sum(decode(k.type_of_call_v, '77', k.gprs_size, 0)) as "Local GPRS Amount"
     , sum(decode(k.type_of_call_v, '78', k.cost_of_call, 0)) as "78"
     , sum(decode(k.type_of_call_v, '78', k.gprs_size, 0)) as "Roaming GPRS Amount"
     
      ,sum(decode(k.type_of_call_v, '77', k.cost_of_call, 78,k.cost_of_call,0)) as "Total GPRS"
      ,sum(decode(k.type_of_call_v, '77', k.gprs_size, 78,k.gprs_size,0)) as "Total GPRS Amount"
     
     
     
     , sum(decode(k.type_of_call_v, '91', k.cost_of_call, 0)) as "91"
     , sum(decode(k.type_of_call_v, '91', k.duration_n, 0)) as "Outgoing Roaming Duration"
    
      , sum(decode(k.type_of_call_v, '92', k.cost_of_call, 0)) as "92"
     , sum(decode(k.type_of_call_v, '92', k.duration_n, 0)) as "Incoming Roaming Duration"
     
     , sum(decode(k.type_of_call_v, '-1', k.cost_of_call, 0)) as "-1"
     
     , sum(decode(k.type_of_call_v, '91', k.cost_of_call, '92',k.cost_of_call,0)) as "Total Roaming"
     , sum(decode(k.type_of_call_v, '91', k.duration_n, '92',k.duration_n,0)) as "Total Roaming Duration"
     , sum(k.cost_of_call) as "Total Sum"
     
      
      from fct_kcell_tdr k
      
 where k.period_invoice in ( '201401','201402','201403','201404','201405','201406','201407','201408','201409','201410','201411','201412')
 group by k.gsm, k.period_invoice
 order by k.gsm;