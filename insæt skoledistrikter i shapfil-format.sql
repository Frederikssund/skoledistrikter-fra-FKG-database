/* HUSK */
/* 1. inds�t det rigtige database navn */
/* 2. inds�t det rigtige view navn nederst i scriptet - jeg har brugt mi_ scriptet, da min database stammer fra den MapInfo m�lrettede database */

USE [min-database]
GO

INSERT INTO [dbo].[dbo_t_5710_born_skole_dis]
           ([geom]
           ,[udd_d_nr]
           ,[udd_d_nv]
           ,[udd_tpkode]
           ,[udd_d_tp]
           ,[strtr_kode]
           ,[starttrin]
           ,[slutr_kode]
           ,[slutttrin]
           ,[sagsnr]
           ,[link]
           ,[temakode]
           ,[temanavn]
           ,[objekt_id]
           ,[vers_id]
           ,[systid_fra]
           ,[systid_til]
           ,[oprettet]
           ,[cvr_kode]
           ,[cvr_navn]
           ,[kom_kode]
           ,[bruger_id]
           ,[oprindkode]
           ,[oprindelse]
           ,[statuskode]
           ,[status]
           ,[off_kode]
           ,[offentlig]
           ,[noegle]
           )

 SELECT
       [geometri]
      ,[udd_distrikt_nr]
      ,[udd_distrikt_navn]
      ,[udd_distrikt_type_kode]
      ,[udd_distrikt_type]
      ,[starttrin_kode]
      ,[starttrin]
      ,[sluttrin_kode]
      ,[slutttrin]
      ,[sagsnr]
      ,[link]
      ,[temakode]
      ,[temanavn]
      ,[objekt_id]
      ,[versions_id]
      ,[systid_fra]
      ,[systid_til]
      ,[oprettet]
      ,[cvr_kode]
      ,[cvr_navn]
      ,[kommunekode]
      ,[bruger_id]
      ,[oprindkode]
      ,[oprindelse]
      ,[statuskode]
      ,[status]
      ,[off_kode]
      ,[offentlig]
      ,[noegle]
  FROM fkg_kl.[dbo].[mi_t_5710_born_skole_dis]
GO

