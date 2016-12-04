use Clinic;
call PatientInfo ("Jack Smith");
call DrugsInfo ("Galstena");
delimiter //
DROP PROCEDURE IF EXISTS PatientInfo //

create procedure PatientInfo (in Patient varchar(30))
language sql 
begin
select Patient_fio Пациент, Diagnosis_name Диагноз, Ward_number Палата, Treatment_in Поступил, Treatment_out Выписка
from Patient P,Ward W,Diagnoses Di,Treatment T 
where P.Patient_diagnosis = Di.Diagnoses_id and P.Patient_Ward_id = W.Ward_id
and T.Treatment_patient = P.Patient_id
and P.Patient_fio = Patient;

end //


DROP PROCEDURE IF EXISTS DrugsInfo //
create procedure DrugsInfo(in Drugs varchar(30))
language sql 
begin
select Drugs_name Название, Drugs_description Описание, Drugs_price Цена from Drugs
where Drugs.Drugs_name = Drugs;
end //

