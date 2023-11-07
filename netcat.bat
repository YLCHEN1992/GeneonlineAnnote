@echo off
%1
set GID=%1
if not exist ./netcat/G%GID% (curl https://www.ncbi.nlm.nih.gov/gene/%GID% -o ./netcat/G%GID% --ssl-no-revoke)
echo %GID% >>geneinfo
findstr "]</dd>" .\netcat\G%GID% >>geneinfo
findstr "href=\"#gene-expression\">See" .\netcat\G%GID% >>geneinfo
echo df~ >>geneinfo


