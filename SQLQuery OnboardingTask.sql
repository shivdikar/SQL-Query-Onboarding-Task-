
1.
SELECT* FROM [dbo].[Property] where id in ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)

SELECT* FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426

select* from [dbo].[PropertyHomeValue] where PropertyId in ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)

select* from [dbo].[PropertyHomeValue] where IsActive = 1 AND 
PropertyId in ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)


--select * from [dbo].[TenantProperty] where PropertyId IN ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)

--select sum(PaymentAmount)from [dbo].[TenantProperty] where PropertyId IN ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)

2.
select sum(PaymentAmount) as totalamount,Paymentfrequencyid, min(startdate) as firstdate ,max(enddate) as lastdate, PropertyId
from [dbo].[TenantProperty] 
--where PropertyId IN ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)
where PaymentFrequencyId is not NULL
group by PropertyId, Paymentfrequencyid
order by PropertyId

3.
select PaymentAmount , Paymentfrequencyid, StartDate, EndDate from [dbo].[TenantProperty] where PropertyId IN ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)

4.
select TenantId,[Name],StartDate,EndDate,PaymentFrequencyId,PaymentAmount,[Value],((paymentamount/[value])*100) as yield
from [dbo].[TenantProperty] 
inner join [dbo].[Property] on dbo.TenantProperty.PropertyId = dbo.Property.Id
inner join [dbo].[PropertyHomeValue] on TenantProperty.PropertyId = PropertyHomeValue.PropertyId
where PropertyHomeValue.ISACTIVE =1  
and TenantProperty.PropertyId IN ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)

5.
select * from [dbo].[Job] 
Inner join dbo.JobStatus on dbo.Job.Jobstatusid = dbo.JobStatus.id
where JobStatusId = 1

6.
select dp.[Name], de.firstName ,de.lastName ,pf.[Name] as Freqname
from [dbo].[Property] as dp
Inner Join [dbo].[Person] as de on dp.Propertytypeid = de.id
Inner join [dbo].[PropertyRentalPayment] on dp.id = [dbo].[PropertyRentalPayment].PropertyId
Inner Join [dbo].[TenantPaymentFrequencies] as pf on [dbo].[PropertyRentalPayment].FrequencyType = pf.Id
Inner Join [dbo].[OwnerProperty] as op on dp.id = op.PropertyId
where dp.id in ( select PropertyId FROM [dbo].[OwnerProperty] WHERE Ownerid= 1426)






