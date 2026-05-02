select * from contact_mech a join postal_address b on a.contact_mech_id = b.contact_mech_id;


select * from postal_address;


desc party_contact_mech;


select
	TABLE_NAME,
	COLUMN_NAME,
	REFERENCED_TABLE_NAME,
	REFERENCED_COLUMN_NAME
from
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
where
	REFERENCED_TABLE_NAME = 'party'
	and TABLE_NAME like "%contact%";




select
	pr.party_id ,
	pcm.EXTENSION ,
	pcm.contact_mech_id,
	cm.INFO_STRING
from
	party pr
join party_contact_mech pcm on
	pr.party_id = pcm.party_id
join 
contact_mech cm on
	pcm.contact_mech_id = cm.contact_mech_id;
	


select
	*
from
	party p
join party_role pr on
	p.party_id = pr.party_id
join role_type pr2 on
	pr.role_type_id = pr2.ROLE_TYPE_ID e_type_id;






