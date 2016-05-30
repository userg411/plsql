select 
oc.Id as Incident_ECO_ID,
oc.RiskLevel,
right('0000'+convert ( varchar(4),oc.occurrenceId ),4)
+'-'+convert(varchar(4),oc.IncidentDateTime, 120) as IncidentId,
'KZ-'+convert(varchar(4),oc.IncidentDateTime, 120)+'-'+right('0000'+convert ( varchar(4),oc.occurrenceId ),4) as IncidentNo,
substring((
	Select ','+cast(p.Name as nvarchar) +  ' ' + cast(p.Surname as nvarchar)
            From [AK_SOCC3].[dbo].[PersonnelInIncidentInfo] pii
            left outer join Person p on pii.PersonnelId = p.Id
            
            Where pii.IncidentId = Oc.Id
               ORDER BY p.Name
            For XML PATH ('')

),2,2000)  as PeopleInIncident, 
substring((
	Select ','+cast(v.plateNumber as nvarchar) +  ' ' + cast(v.Model as nvarchar)
            From [AK_SOCC3].[dbo].VehicleInIncident vii
            left outer join Vehicle v on vii.VehicleId= v.Id
            
            Where vii.IncidentId = Oc.Id
               ORDER BY v.plateNumber
            For XML PATH ('')

),2,2000)  as VehicleInIncident, 
substring((Select ';'+sa.Comment
            From [AK_SOCC3].[dbo].SOPAction sa
            
            Where sa.IncidentId = Oc.Id
            and sa.SOPActionType = 1
               
            For XML PATH (''), type ).value('.', 'nvarchar(max)'),2,2000) as AdditionalInformation,
oc.TargetDate_Date as TargetDate, 
oc.hasFlashBack, 

case when sa.finishDate <> '1753-01-01 00:00:00.000' then 'Closed' when sa.startDate <> '1753-01-01 00:00:00.000' then 'Ongoing' when sa.Id is not null then 'Required' else 'Not required' end as InvestigationStatus,
saf.Id as FlashId



FROM dbo.[Incident] Oc 
left outer join dbo.[SOPAction] sa on sa.IncidentId = oc.Id
	and sa.SOPActionType = 4
	and sa.[Order] = (select MAX(saa.[Order]) from SOPAction saa where sa.Id = saa.Id and saa.SOPActionType = 4) 
left outer join dbo.[SOPAction] saf on saf.IncidentId = oc.Id
	and saf.SOPActionType = 5
	and saf.[Order] = (select MAX(saaf.[Order]) from SOPAction saaf where saf.Id = saaf.Id and saaf.SOPActionType = 5) 

