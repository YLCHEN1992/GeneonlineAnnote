@echo off
chcp 65001 > nul
title YLCHEN Programs
color 0e 
set localroad=%cd%
PATH %PATH%;%localroad%\R-4.3.2\bin\
set parameter1="Homo_sapiens.gene_info"
set /p parameter2="请输入想要注释的基因表格名（仅支持CSV格式）:"
Rscript genenetanno.R %parameter1% %parameter2%
