use Clinic;
call drugsPriceChange("120", "Gepabene");
call deleteLastYearPatient;
drop procedure if exists deleteLastYearPatient;
drop procedure if exists groupByWard;
delimiter // 
drop procedure if exists drugsPriceChange//
create procedure drugsPriceChange(in DrugsPrice int, in DrugsName varchar(30))
language sql
begin
#select Drugs_name Название, Drugs_description Описание, Drugs_price Цена from Drugs;
update Clinic.Drugs set Drugs_price = DrugsPrice where Drugs.Drugs_name = DrugsName;
end //

delimiter //
create procedure deleteLastYearPatient()
language sql
begin
delete from Treatment 
where year(Treatment_out) <  year(now()) and (dayofyear(now())>dayofyear(Treatment_out));
end // 
delimiter //

delimiter //
create procedure groupByWard(in Ward int)
begin
select Patient_fio Пациент, Diagnosis_name Диагноз,Treatment_in Поступил, Doctor_fio Доктор
from Patient P,Diagnoses Di,Treatment T, Doctor D, Ward W
where T.Treatment_patient = P.Patient_id and P.Patient_diagnosis = Di.Diagnoses_id
and P.Patient_ward_id = W.Ward_id and W.Ward_doctor = D.Doctor_id
and W.Ward_number = Ward;
end //