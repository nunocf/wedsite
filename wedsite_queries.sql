-- Generate the invitation links.
select 
	g.id, 
	g.name, 
	i.code,
	concat('https://www.gingeroak.com/#/rsvp/', i.code) as invitation_link
from guests as g
inner join invitations as i on g.invitation_id = i.id
order by g.id asc;

-- selecting all guests for a particular invitation
select * from guests
	inner join invitations on invitations.id = guests.invitation_id
	where invitations.code = 'Pdxldd';
	
-- inserting example
--insert into guests ("name", "invitation_id", "inserted_at", "updated_at")
--	values('Miguel Guimarães', 49, now(), now());

-- List of people coming/not coming/not replied
with accepted as (select * from invitations where accepted = true),
declined_guests as (select * from guests inner join accepted on accepted.id = guests.invitation_id where guests.coming = false),
declined_invitations as (select * from invitations where accepted = false),
coming as (select * from guests as g where g.coming = true),
not_replied as (select * from guests as g where g.coming is NULL)
select 
	count(c) as guests_coming, 
	count(dg) + sum(di.max_guests) as declined_guests,
	count(nr) as not_replied
from invitations as i
	left outer join coming as c on c.invitation_id = i.id
	left outer join declined_guests as dg on dg.invitation_id = i.id
	left outer join not_replied as nr on nr.invitation_id = i.id
	left outer join declined_invitations as di on di.id = i.id;
	
-- list of people with food allergies
select guests.name, guests.food_allergy_notes from guests where guests.has_food_allergies = true;

-- dietary requirements
with 
	guests_coming as (select * from guests where coming = true),
	pork_schnitzel as (select * from guests_coming as gc where gc.diet_type = 'normal' and gc.food_choice = 'option1'),
	pork_dates as (select * from guests_coming as gc where gc.diet_type = 'normal' and gc.food_choice = 'option2'),
	vegetarian as (select * from guests_coming as gc where gc.diet_type = 'vegetarian'),
	halal as (select * from guests_coming as gc where gc.diet_type = 'halal'),
	other as (select * from guests_coming as gc where gc.diet_type = 'other')
select 
	count(ps) as pork_schnitzel,
	count(pd) as pork_dates,
	count(v) as vegetarian,
	count(h) as halal,
	count(o) as other
from guests as g
	left outer join pork_schnitzel as ps on ps.id = g.id
	left outer join pork_dates as pd on pd.id = g.id
	left outer join vegetarian as v on v.id = g.id
	left outer join halal as h on h.id = g.id
	left outer join other as o on o.id = g.id;
	

-- Food choices
select name as pork_schnitzel from guests where guests.coming = true and guests.diet_type = 'normal' and guests.food_choice = 'option1';
select name as pork_dates from guests where guests.coming = true and guests.diet_type = 'normal' and guests.food_choice = 'option2';
select name as vegetarian from guests where guests.coming = true and guests.diet_type = 'vegetarian';
select name as halal from guests where guests.coming = true and guests.diet_type = 'halal';
select name as other, guests.diet_notes from guests where guests.coming = true and guests.diet_type = 'other';

-- list of emails
select * from invitations where invitations.email is not null or invitations.email <> '';

-- Number of known guests
select count(*) from guests;

-- Total guests allowed
select sum(invitations.max_guests) from invitations;