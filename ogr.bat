REM vis start tid (Ikke absolut nødvendig)
@echo %time%

REM sæt CodePage til Latin-1 (Ingen bøvl med ÆØÅ i kommandolinien)
REM ============================================================================================
chcp 1252
REM ============================================================================================

REM Sæt "current dir" til opstartsdirectory for sript (ikke bydende nødvendigt)
REM ============================================================================================
%~d0
cd %~p0
REM ============================================================================================

REM Opsætning at generelle parametre for upload proces (absolut nødvendigt)
REM ============================================================================================
call %~dp0ogr_environment.bat
REM ============================================================================================

REM set aktuelle parameter for server og database til MS SQL Server database
REM ============================================================================================
set "ms_conn=server=DITSERVERNAVN;database=DINDATABASE;trusted_connection=yes"

REM ============================================================================================
REM Eksempel på upload af shape filer
REM ============================================================================================

set "data_dir=C:\....DIN-STI"

REM  Kommandoprocedure     Indata def.                                Lag def. Database    Schema        Tabel
call %~dp0ogr_mssql.bat    "%data_dir%\dbo_t_5710_born_skole_dis.shp" "*"      "%ms_conn%" dbo dbo_t_5710_born_skole_dis

REM ============================================================================================

REM vis sluttid (ikke strengt nødvendigt)
@echo %time%
