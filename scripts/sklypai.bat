
@echo off

set server=
set database=
set user=
set pass=

set ftpHost=127.0.0.1
set ftpUser=scpigit
set ftpPass=copypaste

set filename=Sklypai.tsv
sqlcmd -f 65001 -S "%server%" -d "%database%" -U "%user%" -P "%pass%" -s"	" -W -Q "SET NOCOUNT ON; SELECT * FROM [Opendata_Sklypai]" -o %filename% 
winscp /command "option batch abort" "option confirm off" "open sftp://%ftpUser%:%ftpPass%@%ftpHost%" "put %filename%" "exit"

set filename=Sumos.tsv 
sqlcmd -f 65001 -S "%server%" -d "%database%" -U "%user%" -P "%pass%" -s"	" -W -Q "SET NOCOUNT ON; SELECT * FROM [Opendata_Sumos]" -o %filename% 
winscp /command "option batch abort" "option confirm off" "open sftp://%ftpUser%:%ftpPass%@%ftpHost%" "put %filename%" "exit"

set filename=Apskaiciavimai.tsv 
sqlcmd -f 65001 -S "%server%" -d "%database%" -U "%user%" -P "%pass%" -s"	" -W -Q "SET NOCOUNT ON; SELECT * FROM [Opendata_Apskaiciavimai]" -o %filename% 
winscp /command "option batch abort" "option confirm off" "open sftp://%ftpUser%:%ftpPass%@%ftpHost%" "put %filename%" "exit"
