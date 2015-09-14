# skoledistrikter-fra-FKG-database

##Overførsel af skoledistrikter fra FKG_KL database til det nødvendige shape-format.
Hvis nu man er så heldig, at man allerede har lagt sine skoledistrikter i sin FKG_KL database i MSSQL server, så er her en opskrift til at få de rigtige database informationer fra FKG_KL databasen over i det shapefil-format, som vi nu skal aflevere data i:

1.	indlæs den vedhæftede shape-fil dbo_t_5710_born_skole_dis.shp i en database (fx vha. ogr2ogr, se hjælp nedenfor) – således har du det rigtige format i databasen.
2.	kør vedhæftede script i fx SQL management studio indsæt skoledistrikter i shapfil-format.sql
3.	Åbn den nye tabel i QGIS og Gem som shape-fil



##Eksempel på ogr2ogr:
Der er vedhæftet 4 filer til denne mail:
ogr_environment.bat
ogr_mssql.bat
ogr.bat
koer.bat

Der skal blot ændres lidt i  koer.bat, hvor du skal ændre servernavn, databasenavn og netværksstien til dbo_t_5710_born_skole_dis.shp

Dobbeltklik på koer.bat, når rettelserne er foretaget. Der genereres en log, som man kan kigge i, hvis der opstår fejl.
Hvis der ikke opstår fejl, lægges shapefilen i den valgte database.
