@echo on
REM ============================================================================================
REM == Ops�tning af generelle environment vars til behandling af spatielle data vha OGR2OGR   ==
REM == OGR2OGR ver 1.11 b�r benyttes                                                          ==
REM == Programm�rer: Anette Roseng�rd Poulsen & Bo Victor Thomsen, Frederikssund Kommune      ==
REM ============================================================================================

REM Hovedmappe for OSGEO4W (OGR, GDAL og Python)
REM =====================================================
REM set OSGEO4W_ROOT=C:\OSGeo4w64
set OSGEO4W_ROOT=C:\OSGeo4w
REM =====================================================

REM ============== Nix Pille ============================
set PATH=%OSGEO4W_ROOT%\bin;%PATH%
for %%f in ("%OSGEO4W_ROOT%\etc\ini\*.bat") do call "%%f"
REM =====================================================

REM *Kun* aktuel ved upload af data til Postgres
REM S�tter character-encoding for inddata
REM =====================================================
set "PGCLIENTENCODING=LATIN1"
REM set "PGCLIENTENCODING=UTF8"
REM =====================================================

REM Navn p� geometri felt oprettet af OGR i database tabeller
REM =====================================================
set ogr_geom=geom
REM =====================================================

REM Navn p� primary key felt oprettet af OGR i database tabeller
REM =====================================================
set ogr_fid=fid
REM =====================================================

REM Navn p� administrativt dato felt (varchar (10), indeholder ����-mm-dd)
REM Hvis det er lig med <ingenting> oprettes og populeres feltet ikke
REM =====================================================
REM set ogr_dato=
set ogr_dato=hent_dato
REM =====================================================

REM EPSG v�rdi for projektion (normalt 25832 aka. UTM32/ETRS89
REM =====================================================
REM set ogr_epsg=4326
REM set ogr_epsg=25833
set ogr_epsg=25832
REM =====================================================

REM Parametre til generering af spatielt indeks for MS SQL Server...
REM Omr�de definition: minx,miny,maxx,maxy  - koordinatv�rdier angives i ogr_epsg defineret projektion
REM =====================================================

REM Eksempel Danmark.. (f�r ikke hele s�territoriet med)
set "ogr_spatial=350000,6020000,950000,6450000"

REM Eksempel: Frederikssund Kommune....
REM set "ogr_spatial=678577,6178960,702291,6202870"
REM =====================================================

REM Geografisk afgr�sning ved upload af data
REM Omr�de definition: minx miny maxx maxy - koordinatv�rdier angives i ogr_epsg defineret projektion
REM =====================================================

REM Eksempel: Frederikssund Kommune....
REM set ogr_bbox="678577 6178960 702291 6202870"

REM Eksempel: ingen geografisk begr�sning....
set "ogr_bbox=
REM =====================================================




