@echo off
chcp 65001
:menu
cls
title YLCHEN Programs
color 0e 
echo	╔══════════════════════════════════════════════╗
echo		NCBI Gene Summary                    
echo	╠══════════════════════════════════════════════╣
echo		解决问题：
echo.   
echo		通过基因名（Human Symbol）批量获取
echo		基因介绍和注释信息
echo.                         
echo		1. 开始运行                        
echo		2. 查看详细                         
echo		3. 退出                         
echo	╚══════════════════════════════════════════════╝
echo.   
echo 源码地址：https://github.com/YLCHEN1992/GeneonlineAnnote
echo. 
set /p choice=请输入选项号码: 
if "%choice%"=="1" (
    call Stargeneanno.bat
    goto menu
) else if "%choice%"=="2" (
echo 	1.准备CSV表格文件，表头必须有一列为Genes表头，且Genes为人种基因标准写法（全大写）
echo 	2.需要基因ID注释文件 Homo_sapiens.gene_info 
echo  	 下载地址：https://ftp.ncbi.nlm.nih.gov/gene/DATA/GENE_INFO/Mammalia/Homo_sapiens.gene_info.gz
echo 	   解压后放入程序目录
echo 	3.正准备完毕后，运行程序，输入表格名称即可
echo 	4.需要联网，基因详细信息储存于netcat文件夹中，生成的genesummary.csv即为基因summary信息
echo 	5.summary为在线抓取，如需获取最新summary需要删除netcat文件夹重新在线注释
echo 	6.注释结果主要包括summary和转录组表达情况描述，需要安装R
echo 按任意键返回
pause >nul
goto menu
) else if "%choice%"=="3" (
    exit
) else (
    echo 无效的选项，请重新输入。
    pause
    goto menu
)
