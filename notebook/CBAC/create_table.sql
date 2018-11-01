create schema transplant ; 
drop table if exists  transplant.dim_donor  ; 
drop table  if exists transplant.fct_haemodynamic ; 
drop table if exists  transplant.fct_neurology  ; 
drop table if exists transplant.fct_respiratory ;
drop table if exists transplant.fct_temperature ; 
drop table if exists transplant.clean_data ; 
create table transplant.dim_donor  ( id_patient int , age_donor varchar , sex_donor varchar , bmi_donor varchar , poids_donor varchar , taille_donor varchar , tabagisme_donor varchar , aspirations_donor float , rx_donor varchar , pf_donor float , oto_score float );
COPY   transplant.dim_donor ( id_patient, age_donor, sex_donor, bmi_donor, poids_donor , taille_donor, tabagisme_donor , aspirations_donor  , rx_donor, pf_donor, oto_score  ) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/dim_donor.csv' with delimiter as ',' direct ; 
create table transplant.dim_patient  ( id_patient int , exclusion_plasmapherese varchar , exclusion_pf varchar , exclusion_ino varchar , exclusion_lactate varchar , date_transplantation varchar , date_sortie_bloc varchar , heure_arrivee_rea varchar , age int , sexe int , body_mass_index int , diabetes int , preoperative_icu float , preoperative_vasopressor float , preoperative_mechanical_ventilation float , super_urgence int , time_on_waiting_liste int , other_organ_transplantation int , pathologie int , retransplant int , transplanted_twice_during_study_period int , thoracic_surgery_history int , preoperative_pulmonary_hypertension float , plasmapherese int , pfo varchar , first_lung_ischemic_time varchar , second_lung_ischemic_time varchar , exvivo float , preoperative_ecmo float , postoperative_ecmo float , only_intraoperative_ecmo float , ecmo_during_surgery float , ecmo_duration float , cec float , moment_de_pose_ecmo float , cause_ecmo float , pulmonary_reduction float , adrenaline_perop float , prdc float , ffp float , platelets float , fluid_support float , estimated_blood_loss varchar , no_dependence float , cause_no_dependance float , adre_end_surgery float , nad_end_surgery varchar , los_first_ventilation float , los_total_ventilation float , immediate_extubation float , secondary_intubation float , time_to_secondary_intubation float , secondary_ecmo float , delai_recours_ecmo float , cause_ecmo_secondaire float , postoperative_vasopressive_support float , acfa float , prbc float , ffp_1 float , platelets_1 float , cva float , hemodyalisis float , tracheostomy float , reoperation_for_bleeding float , bleeding float , lower_limb_complication float , lower_limb_ischemia float , scarpa_complication float , vascular_complications float , thromboembolic_complication float , choc_septique float , cardiac_arrest_during_surgery float , los_icu float , los_hosp float , in_hospital_mortality float , d_survival_30 float , p_f_h0 varchar , pgd_h0 varchar , p_f_end_surgery float , pgd_end_surgery varchar , time_last_pf float , pdg_h24 float , pgd_h48 float , pgd3 float , date_de_deces varchar , lactates_initial float , lactates_clampage_cote_1 float , lactates_declampage_cote_1 float , lactates_clampage_cote_2 float , lactates_declampage_cote_2 float , lactates_fermeture float );
COPY   transplant.dim_patient ( id_patient, exclusion_plasmapherese, exclusion_pf, exclusion_ino, exclusion_lactate, date_transplantation, date_sortie_bloc, heure_arrivee_rea, age, sexe, body_mass_index, diabetes, preoperative_icu, preoperative_vasopressor, preoperative_mechanical_ventilation, super_urgence, time_on_waiting_liste, other_organ_transplantation, pathologie, retransplant, transplanted_twice_during_study_period, thoracic_surgery_history, preoperative_pulmonary_hypertension, plasmapherese, pfo, first_lung_ischemic_time, second_lung_ischemic_time, exvivo, preoperative_ecmo, postoperative_ecmo, only_intraoperative_ecmo, ecmo_during_surgery, ecmo_duration, cec, moment_de_pose_ecmo, cause_ecmo, pulmonary_reduction, adrenaline_perop, prdc, ffp, platelets, fluid_support, estimated_blood_loss, no_dependence, cause_no_dependance, adre_end_surgery, nad_end_surgery, los_first_ventilation, los_total_ventilation, immediate_extubation, secondary_intubation, time_to_secondary_intubation, secondary_ecmo, delai_recours_ecmo, cause_ecmo_secondaire, postoperative_vasopressive_support, acfa, prbc, ffp_1, platelets_1, cva, hemodyalisis, tracheostomy, reoperation_for_bleeding, bleeding, lower_limb_complication, lower_limb_ischemia, scarpa_complication, vascular_complications, thromboembolic_complication, choc_septique, cardiac_arrest_during_surgery, los_icu, los_hosp, in_hospital_mortality, d_survival_30, p_f_h0, pgd_h0, p_f_end_surgery, pgd_end_surgery, time_last_pf, pdg_h24, pgd_h48, pgd3, date_de_deces, lactates_initial, lactates_clampage_cote_1, lactates_declampage_cote_1, lactates_clampage_cote_2, lactates_declampage_cote_2, lactates_fermeture ) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/dim_patient.csv' with delimiter as ',' direct ; 
create table transplant.fct_haemodynamic  ( index int , dc float , fc float , papdia float , papmoy float , papsys float , pasd float , pasm float , pass float , pnid int , pnim int , pnis float , id_patient float , time varchar );
COPY   transplant.fct_haemodynamic ( index, dc, fc, papdia, papmoy, papsys, pasd, pasm, pass, pnid, pnim, pnis, id_patient, time ) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/fct_haemodynamic.csv' with delimiter as ',' direct ; 
create table transplant.fct_neurology  ( index int , bis int , et_des float , et_sevo float , nmt_tof float , nmtratio float , id_patient float , time varchar );
COPY   transplant.fct_neurology ( index, bis, et_des, et_sevo, nmt_tof, nmtratio, id_patient, time ) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/fct_neurology.csv' with delimiter as ',' direct ; 
create table transplant.fct_respiratory  ( index int , etco2 float , eto2 float , fico2 float , fin2o float , fr int , fr_ecg int , fio2 float , mac int , peeptotal int , pmax int , pmean int , pplat int , rr_co2 float , spo2 float , svo2__m float , vt float , id_patient float , time varchar );
COPY   transplant.fct_respiratory ( index, etco2, eto2, fico2, fin2o, fr, fr_ecg, fio2, mac, peeptotal, pmax, pmean, pplat, rr_co2, spo2, svo2__m, vt, id_patient, time ) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/fct_respiratory.csv' with delimiter as ',' direct ; 
create table transplant.fct_temperature  ( index int , temp float , id_patient float , time varchar );
COPY   transplant.fct_temperature ( index, temp, id_patient, time) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/fct_temperature.csv' with delimiter as ',' direct ; 
create table transplant.clean_data  ( B_I_S int , BIS_SR float , DC float , ET_Des float , ET_Sevo float , ETCO2 float , ETCO2_mmHg float , ETO2 float , FC float , FICO2 float , FICO2_mmHg int , FIN2O float , FR int , FR_ecg int , FiO2 float , MAC int , NMT_TOF float , NMTratio float , PAPdia float , PAPmoy float , PAPsys float , PASd float , PASm float , PASs float , PEEPtotal int , PNId int , PNIm int , PNIs float , Pmax int , Pmean int , Pplat int , RR_co2 float , SpO2 float , SvO2_m float , Temperature float , VT float , id_patient int , time_var varchar );
COPY   transplant.clean_data ( B_I_S, BIS_SR, DC, ET_Des, ET_Sevo, ETCO2, ETCO2_mmHg, ETO2, FC, FICO2, FICO2_mmHg, FIN2O, FR, FR_ecg, FiO2, MAC, NMT_TOF, NMTratio, PAPdia, PAPmoy, PAPsys, PASd, PASm, PASs, PEEPtotal, PNId, PNIm, PNIs, Pmax, Pmean, Pplat, RR_co2, SpO2, SvO2_m, Temperature, VT, id_patient, time_var) FROM local '/Users/clementbaccar/Desktop/dfg/batch_5_transplant/data/clean_data/clean_Bloc_files.csv' with delimiter as ',' direct ; 



