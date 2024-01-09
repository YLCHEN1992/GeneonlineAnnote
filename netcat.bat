@echo off
set GID=%1
if not exist ./netcat/G%GID% (curl -s --ssl-no-revoke https://www.ncbi.nlm.nih.gov/gene/%GID% > ./netcat/G%GID%)
echo %GID% >>geneinfo
findstr "]</dd>" .\netcat\G%GID% >>geneinfo
findstr "href=\"#gene-expression\">See" .\netcat\G%GID% >>geneinfo
echo df~ >>geneinfo


