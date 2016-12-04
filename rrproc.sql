use Clinic;

call patientIn("2015-01-05 10:00:00","pancreatitis");
call patientIn("2015-01-05 10:00:00","cirrhosis");
call PatientInWard(101);

DELIMITER //
DROP PROCEDURE IF EXISTS patientIn //

CREATE PROCEDURE patientIn(In TreatmentIn datetime, In DiagnosesP varchar(30))
LANGUAGE SQL  
BEGIN
SELECT Patient_fio Пациент, Diagnosis_name Диагноз, Treatment_in Поступил
FROM Patient P, Diagnoses D, Treatment T
where T.Treatment_patient = P.Patient_id 
and P.Patient_diagnosis = D.Diagnoses_id
and T.Treatment_in = TreatmentIn
and D.Diagnosis_name = DiagnosesP;
end //

delimiter $$
drop procedure if exists PatientInWard;
delimiter $$
create procedure PatientInWard (in WardP int)
language sql
begin
select count(distinct Patient_fio) Пациент, Ward_number Палата
from Patient P, Ward W 
where P.Patient_Ward_id = W.Ward_id
and W.Ward_number = WardP;
end $$

delimiter $$
create procedure DoctorBusy()
language sql 
begin
Select count(distinct Patient_fio) 'Кол-во Пациентов' , Doctor_fio Врач
from Patient P, Doctor D, Ward W
where P.Patient_Ward_id = W.Ward_id
and W.Ward_doctor = D.Doctor_id
having count(Patient_fio) >= all(select count(*)
from Patient P, Treatment T, Ward W, Doctor D
where T.Treatment_patient = P.Patient_id 
and P.Patient_Ward_id = W.Ward_id
and W.Ward_doctor = D.Doctor_id);
end $$


