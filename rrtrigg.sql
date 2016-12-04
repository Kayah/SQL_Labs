use Clinic;
drop trigger if exists `on_insert_treatment`;
#Если такой пациент уже записан на лечение , то не добовлять
delimiter //
create trigger `on_insert_treatment`
before insert on Treatment
for each row 
begin
declare treatin datetime;
declare treatout datetime;
declare treatpat int;
SET @Treatment := NEW.Treatment_id;
SET @Treat_in := NEW.Treatment_in;
SET @Treat_out := NEW.Treatment_out;
SET @Treat_patient := NEW.Treatment_patient;
SET @Treat_price := NEW.Treatment_price;

if(@Treat_patient in (select Treatment_patient from Treatment))and(@Treat_in in (select Treatment_in from Treatment))
and (@Treat_out in (select Treatment_out from Treatment))then
SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'this patient has already been recorded';

else if(select count(*)from Treatment T,Patient P,Ward W 
where T.Treatment_patient = P.Patient_id 
and P.Patient_ward_id = W.Ward_id
and T.Treatment_patient = @Treat_patient) >= 2 then
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = "The Ward is busy";

else if (@Treat_in>@Treat_out) then
signal sqlstate '45000'
set message_text = "out date can not be earlier than the in date";
end if;


#else if(@Treat_patient in (select Treatment_patient from Treatment))

/*select Treatment.Treatment_patient, Treatment.Treatment_in, Treatment.Treatment_out into treatpat, treatin,treatout from Treatment T
where T.Treatment_patient = @Treat_patient and T.Treatment_in = @Treat_in and T.Treatment_out = @Treat_out;
if (treatpat = @Treat_patient) and (datetime(@Treat_in)>datetime(treatout))then
signal sqlstate '45000'
set message_text = "out date can not be earlier than the in date";
END IF ;*/
end if;
end if;
end //
