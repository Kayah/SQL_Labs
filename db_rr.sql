drop database Clinic;
create database Clinic;
use Clinic;

create table Treatment(
Treatment_id int auto_increment primary key,
Treatment_name varchar(30) not null,
Treatment_in datetime not null,
Treatment_out datetime not null,
Treatment_patient int,
Treatment_price int not null,
Treatment_drugs int,
constraint TreatmentPatientForeign foreign key (Treatment_patient) references Patient(Patient_id),
constraint TreatmentDrugsForeign foreign key (Treatment_drugs) references Drugs(Drugs_id) on delete cascade

);
create table Patient(
Patient_id int primary key auto_increment,
Patient_fio varchar(30) not null,
Patient_diagnosis int not null,
Patient_insurance_policy int, #страховой полис
Patient_Ward_id int not null,
constraint PatientDiagnosisForeing foreign key (Patient_diagnosis) references Diagnoses(Diagnoses_id) on delete cascade,
constraint PatientWardForeign foreign key (Patient_Ward_id) references Ward(Ward_id) on delete cascade,
constraint PatientInsuranceForeign foreign key (Patient_insurance_policy) references Insurance_policy(Insurance_policy_id) on delete cascade
);

create table Insurance_policy(
Insurance_policy_id int auto_increment primary key,
Insurance_policy_number decimal not null unique
);

create table Diagnoses(
Diagnoses_id int primary key auto_increment,
Diagnosis_name varchar(30) unique not null
);

create table Ward(
Ward_id int auto_increment primary key,
Ward_number int not null unique,
Ward_doctor int not null,
constraint WardDoctorForeign foreign key (Ward_doctor) references Doctor(Doctor_id) on delete cascade

);

create table Doctor(
Doctor_id int auto_increment primary key,
Doctor_fio varchar(30) not null,
Doctor_specialization varchar(30) not null
);

create table Drugs(
Drugs_id int auto_increment primary key,
Drugs_name varchar(30) not null unique,
Drugs_description varchar(30) not null unique,
Drugs_price int not null
);
