
if not exists (select 1 from ApplicationPages where AppPageID =141)
begin
insert into ApplicationPages 
select 141,'AD - Data Cleanup','Data Cleanup','Data Cleanup',1,0,'ContentPages/Administration/DataCleanup.aspx',1,1,10000,GETDATE(),10000,GETDATE()

insert into ApplicationModulePages
select 148,11,141,0,1,'Tab',97,11,0,NULL,1,10000,GETDATE(),10000,GETDATE()
end


declare @recipients varchar(100)
select @recipients= AppConfigParamValue  from ApplicationConfigParamValues
where AppConfigParamID =20
insert into ApplicationConfigurationParams
select * from [10.15.53.9].iteration16.dbo.ApplicationConfigurationParams
where AppConfigParamID in (
20,
21,
22,
23,
24,
25,
26,
27
)
and AppConfigParamID not in (select AppConfigParamID from ApplicationConfigurationParams )

insert into ApplicationConfigParamValues
select * from [10.15.53.9].iteration16.dbo.ApplicationConfigParamValues 
where AppConfigParamID in (
20,
21,
22,
23,
24,
25,
26,
27
)
and AppConfigParamID not in (select AppConfigParamID from ApplicationConfigParamValues )

update ApplicationConfigurationParams set AppConfigParamDesc=a.AppConfigParamDesc 
from
(
	select * from [10.15.53.9].iteration16.dbo.ApplicationConfigurationParams 
	where AppConfigParamID in (
	20,
	21,
	22,
	23,
	24,
	25,
	26,
	27)
)a inner join ApplicationConfigurationParams b on a.AppConfigParamID=b.AppConfigParamID

update ApplicationConfigParamValues set AppConfigParamValue=@recipients
where AppConfigParamID in (
	20,
	21,
	22,
	23,
	24,
	25,
	26,
	27)