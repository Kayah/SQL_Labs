use Clinic;
#==================Drugs
insert into Drugs(Drugs_name,Drugs_description,Drugs_price)values("Galstena", "Complex homeopathic medication",150);#панкреатит
insert into Drugs(Drugs_name,Drugs_description,Drugs_price)values("Gepabene","Treatment of liver diseases",120);#цироз печени
select * from Drugs;
#==================Diagnoses
insert into Diagnoses(Diagnosis_name)values("pancreatitis");
insert into Diagnoses(Diagnosis_name)values("cirrhosis");
select * from Diagnoses;
#==================Docotor
insert into Doctor(Doctor_fio,Doctor_specialization)values("Sergei Pertovich Shahov","haematologist");
insert into Doctor(Doctor_fio,Doctor_specialization)values("Aleksandr Aleksandrovich Shevk","gastroenterologist");
select * from Doctor;
#==================Ward
insert into Ward(Ward_number,Ward_doctor)values(101,1);
insert into Ward(Ward_number,Ward_doctor)values(111,1);
insert into Ward(Ward_number,Ward_doctor)values(202,2);
select * from Ward;
#==================Insurance_policy
insert into Insurance_policy(insurance_policy_number)values(3214568391);
insert into Insurance_policy(insurance_policy_number)values(9452930130);
insert into Insurance_policy(insurance_policy_number)values(2468786437);
insert into Insurance_policy(insurance_policy_number)values(1268211073);
insert into Insurance_policy(insurance_policy_number)values(4268512352);
select * from Insurance_policy;
#==================Patient
insert into Patient(Patient_fio,Patient_diagnosis,Patient_insurance_policy,Patient_Ward_id )values("Emelyan Fedorovich Vasuk",1,1,1);
insert into Patient(Patient_fio,Patient_diagnosis,Patient_insurance_policy,Patient_Ward_id )values("Egor Artemovich Arbuzov",1,2,1);
insert into Patient(Patient_fio,Patient_diagnosis,Patient_insurance_policy,Patient_Ward_id )values("Jack Smith",2,3,3);
insert into Patient(Patient_fio,Patient_diagnosis,Patient_insurance_policy,Patient_Ward_id )values("Sam Toh",1,4,1);
insert into Patient(Patient_fio,Patient_diagnosis,Patient_insurance_policy,Patient_Ward_id )values("Frank Tales",2,5,3);
select * from Patient;
#==================Treatment
insert into Treatment(Treatment_name,Treatment_in,Treatment_out,Treatment_patient,Treatment_price,Treatment_drugs)values("Treatment of pancreatitis","2015-01-05 10:00:00","2015-02-05 12:00:00",1,1000,1);
insert into Treatment(Treatment_name,Treatment_in,Treatment_out,Treatment_patient,Treatment_price,Treatment_drugs)values("Treatment of pancreatitis","2014-01-05 10:00:00","2014-12-05 12:00:00",1,1000,1);
insert into Treatment(Treatment_name,Treatment_in,Treatment_out,Treatment_patient,Treatment_price,Treatment_drugs)values("Treatment of pancreatitis","2015-01-05 10:00:00","2015-02-05 12:00:00",4,1000,1);
insert into Treatment(Treatment_name,Treatment_in,Treatment_out,Treatment_patient,Treatment_price,Treatment_drugs)values("Treatment of pancreatitis","2015-05-05 10:00:00","2016-02-07 12:00:00",2,1000,1);
insert into Treatment(Treatment_name,Treatment_in,Treatment_out,Treatment_patient,Treatment_price,Treatment_drugs)values("Treatment of cirrhosis","2015-01-05 10:00:00","2015-01-25 12:00:00",3,900,2);
insert into Treatment(Treatment_name,Treatment_in,Treatment_out,Treatment_patient,Treatment_price,Treatment_drugs)values("Treatment of cirrhosis","2015-01-05 10:00:00","2014-02-15 10:00:00",5,990,2);
select * from Treatment;
#delete from Treatment where year(Treatment_out) <  year(now()) and (dayofyear(now())>dayofyear(Treatment_out));
#==================
select Treatment_name,Treatment_in,Treatment_out,Patient_fio,Treatment_price + Drugs_price as Price
from Treatment T, Patient P, Diagnoses D, Drugs Dr
where T.Treatment_patient = P.Patient_id and P.Patient_diagnosis = D.Diagnoses_id 
and D.Diagnoses_drugs = Dr.Drugs_id;

select Patient_fio, Diagnosis_name, Treatment_out from Treatment T, Patient P, Diagnoses D 
where T.Treatment_patient = P.Patient_id and P.Patient_diagnosis = D.Diagnoses_id
and T.Treatment_out like "2015-02-05 12:00:00";

select Patient_fio , Diagnosis_name, insurance_policy_number, Ward_number from Patient P,Ward W,Diagnoses Di,Insurance_policy IP
where P.Patient_diagnosis = Di.Diagnoses_id and P.Patient_insurance_policy = IP.Insurance_policy_id 
and P.Patient_Ward_id = W.Ward_id;

select Diagnosis_name,Drugs_name,Drugs_price from Diagnoses,Drugs where Diagnoses.Diagnoses_drugs = Drugs.Drugs_id ;
select Doctor_fio,Doctor_specialization,Ward_number from Ward,Doctor where Ward.Ward_doctor = Doctor.Doctor_id;

call groupByWard(101);
call DoctorBusy;

drop procedure DoctorBusy;