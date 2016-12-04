use Clinic;

drop view patientRecords;
create view patientRecords
as 
select Patient_fio Пациент, Diagnosis_name Диагноз, Ward_number Палата, Treatment_in Поступил
from Patient P,Ward W,Diagnoses Di,Treatment T 
where P.Patient_diagnosis = Di.Diagnoses_id and P.Patient_Ward_id = W.Ward_id
and T.Treatment_patient = P.Patient_id;
select * from  patientRecords;
Select * from patientRecords where Поступил  = "2015-01-05 10:00:00" and Диагноз = "pancreatitis";



drop view dischargedPatients;
create view dischargedPatients
as
select Patient_fio Пациент, Diagnosis_name Диагноз, Treatment_out Выписан from Treatment T, Patient P, Diagnoses D 
where T.Treatment_patient = P.Patient_id and P.Patient_diagnosis = D.Diagnoses_id
and T.Treatment_out <= now();
select * from dischargedPatients;



drop view TreatPrice;
create view TreatPrice
as
select Patient_fio Пациент, Diagnosis_name Диагноз, Insurance_policy_number Полис, Treatment_price + Treatment_drugs as Price
from Patient P, Diagnoses Di, Insurance_policy I, Treatment T, Drugs D 
where P.Patient_diagnosis = Di.Diagnoses_id and P.Patient_insurance_policy = I.Insurance_policy_id
and T.Treatment_drugs = D.Drugs_id and T.Treatment_patient = P.Patient_id;
select * from TreatPrice;

select * from TreatPrice where Пациент = "Jack Smith";

drop view DrugsInfo;
create view DrugsInfo
as
select Drugs_name Название, Drugs_description Описание, Drugs_price Цена from Drugs;
select * from DrugsInfo;

drop view patientsListInfo;
create view patientsListInfo
as
select Patient_fio Пациент, Diagnosis_name Диагноз, Ward_number Палата, Treatment_in Поступил, Doctor_fio Доктор
from Patient P,Ward W,Diagnoses Di,Treatment T, Doctor D 
where P.Patient_diagnosis = Di.Diagnoses_id and T.Treatment_patient = P.Patient_id
and P.Patient_ward_id = W.Ward_id and W.Ward_doctor = D.Doctor_id;
select * from patientsListInfo;