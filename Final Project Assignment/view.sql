create view MD_PA_Customers as
select p.firstName , p.lastName , v.vehicle_vin , v.vehicle_make ,v.vehicle_model  from
Person p 
join Vehicle v 
on v.ownerID = p.id 
join Payor pay 
on pay.PayorID = p.id 
join Insurance i
on i.InsuranceID = pay.InsuranceID 
where p.state = "MD" or p.state = "PA";

