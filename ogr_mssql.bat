@echo on
REM ============================================================================================
REM == Upload af spatielle data til MS SQL Server fra vilk�lige datakilder                    ==
REM == OGR2OGR ver 1.11 b�r benyttes                                                          ==
REM == Programm�rer: Anette Roseng�rd Poulsen & Bo Victor Thomsen, Frederikssund Kommune      ==
REM ============================================================================================

REM Inddata check, alle 5 parametre *skal* v�re angivet
REM =====================================================
REM Parm. 1, OGR inddatakilde, f.eks wfs definition
set xp1="%~1" 

REM Parm. 2, Lag definition for inddatakilde; hvis den ikke benyttes (f.eks tab og shape), anvendes en * i kommandolinien som parameter
if #%~2==#* (set xp2=) else (set xp2="%~2")

REM Parm. 3, Definition af database forbindelse
set xp3="%~3" 

REM Parm. 4, Schema for tabel; angiv en "*" for default
if #%~4==#* (set xp4=dbo) else (set xp4=%~4)

REM Parm. 5, Navn for ny tabel; angiv en "*" hvis lagnavn �nskes benyttet 
if #%~5==#* (set xp5=%xp2%) else (set xp5=%~5)

REM Tabelnavn renses for tumpetegn (Tilf�jes efter behov)
set set xp5=%xp5: =_% & set set xp5=%xp5::=_%
REM =====================================================

REM Ops�tning af semipermanente variable
REM =====================================================

REM Der genereres en evt. ""where"" clause
if not #%ogr_where%==# (set xp6=-where %ogr_where%) else (set xp6=) 

REM Der genereres en evt. "bbox" clause
if not "%ogr_bbox%"=="" (set xp7=-spat %ogr_bbox%) else (set xp7=) 

REM Sanitycheck af �vrige parametre
if #%ogr_geom%==# set ogr_geom=geom
if #%ogr_fid%==# set ogr_fid=fid
if #%ogr_epsg%==# set ogr_epsg=25832
if "%ogr_spatial%"=="" set "ogr_spatial=350000,6020000,950000,6450000"
REM =====================================================

REM Upload af data til MS SQL Server
REM =====================================================
ogr2ogr -gt 100000 -skipfailures -overwrite -lco FID="%ogr_fid%" -lco GEOM_NAME="%ogr_geom%" -lco OVERWRITE=YES -lco SCHEMA="%xp4%" -nln "%xp5%" -a_srs "EPSG:%ogr_epsg%"  %xp6% %xp7% -f "MSSQLSpatial" MSSQL:%xp3% %xp1% %xp2%
REM =====================================================

REM Generer spatielt indeks. Dette trin kan fjernes ved overgang til GDAL ver. 2.n
REM =====================================================
ogrinfo -q -sql "CREATE SPATIAL INDEX  [SPX_%xp5%] ON [%xp4%].[%xp5%] ([%ogr_geom%]) USING GEOMETRY_GRID WITH (BOUNDING_BOX =(%ogr_spatial%))" MSSQL:%xp3%
REM =====================================================

REM Hvis ogr_dato er sat, autogenereres der et nyt felt, som indeholder dato for indl�gning af data 
REM =====================================================
if not #%ogr_dato%==# (
  ogrinfo -q -sql "ALTER TABLE [%xp4%].[%xp5%] ADD [%ogr_dato%] varchar(10) NULL CONSTRAINT [DF_%xp4%_%xp5%_%ogr_dato%] DEFAULT (CONVERT ( varchar(10), getdate(), 120))" MSSQL:%xp3%
  ogrinfo -q -sql "UPDATE [%xp4%].[%xp5%]  SET %ogr_dato%=CONVERT ( varchar(10), getdate(), 120)" MSSQL:%xp3%
)
REM =====================================================
