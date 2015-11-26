create table Treatment(
Treatment_id int auto_increment primary key,
Treatment_name varchar(30) not null unique,
Treatment_in datetime not null,
Treatment_out datetime not null,
Treatment_drugs int,
Treatment_patient int,
Treatment_price int not null,
constraint TreatmentPatientForeign foreign key (Treatment_patient) references Patient(Patient_id),
constraint TreatmentPriceForeign foreign key (Treatment_price) references Price(Price_id)
);
create table Patient(
Patient_id int primary key auto_increment,
Patient_fio varchar(30) not null,
Patient_diagnosis int not null,
Patient_insurance_policy int, #страховой полис
Patient_ward_number int not null,#палата
constraint PatientDiagnosisForeing foreign key (Patient_diagnosis) references Diagnoses(Diagnoses_id) on delete cascade,
constraint PatientWardForeign foreign key (Patient_ward_number) references Ward(Ward_id) on delete cascade,
constraint PatientInsuranceForeign foreign key (Patient_insurance_policy) references Insurance_policy(Insurance_policy_id) on delete cascade
);
create table Insurance_policy(
Insurance_policy_id int auto_increment primary key,
Insurance_policy_number int not null
);

create table Diagnoses(
Diagnoses_id int primary key auto_increment,
Diagnosis_name varchar(30) unique not null,
Diagnoses_drugs int not null,
constraint DsagnosesDrugsForeign foreign key (Diagnoces_drugs) references Drugs(Drugs_id) on delete cascade
);

create table Ward(
Ward_id int auto_increment primary key,
Ward_number int not null unique
);

create table Doctor(
Doctor_id int auto_increment primary key,
Doctor_fio varchar(30) not null,
Doctor_specialization varchar(30) not null,
Doctor_ward_handling int not null,
constraint DoctorWardForeign foreign key (Doctor_ward_handling) references Ward(Ward_id) on delete cascade
);

create table Drugs(
Drugs_id int auto_increment primary key,
Drugs_name varchar(30) not null unique,
Drugs_description varchar(30) not null unique,
Drugs_price int not null
);

create table Price(
Price_id int auto_increment primary key,
Drugs int,
constraint PriceDrugsForeign foreign key (Drugs) references Drugs(Drugs_id) on delete cascade
);