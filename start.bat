@echo off
:menu
cls
title YLCHEN Programs
color 0e 
echo	�X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo		NCBI Gene Summary                    
echo	�d�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�g
echo		������⣺
echo.   
echo		ͨ����������Human Symbol��������ȡ
echo		������ܺ�ע����Ϣ
echo.                         
echo		1. ��ʼ����                        
echo		2. �鿴��ϸ                         
echo		3. �˳�                         
echo	�^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
echo.   
echo Դ���ַ��https://github.com/YLCHEN1992/GeneonlineAnnote
echo. 
set /p choice=������ѡ�����: 
if "%choice%"=="1" (
    call Stargeneanno.bat
) else if "%choice%"=="2" (
echo 	1.׼��CSV����ļ�����ͷ������һ��ΪGenes��ͷ����GenesΪ���ֻ����׼д����ȫ��д��
echo 	2.��Ҫ����IDע���ļ� Homo_sapiens.gene_info ���б�Ҫ�ɸ���
echo  	 ���ص�ַ��https://ftp.ncbi.nlm.nih.gov/gene/DATA/GENE_INFO/Mammalia/Homo_sapiens.gene_info.gz
echo 	   ��ѹ��������Ŀ¼
echo 	3.��׼����Ϻ����г������������Ƽ���
echo 	4.��Ҫ������������ϸ��Ϣ������netcat�ļ����У����ɵ�genesummary.csv��Ϊ����summary��Ϣ
echo 	5.summaryΪ����ץȡ�������ȡ����summary��Ҫɾ��netcat�ļ�����������ע��
echo 	6.ע�ͽ����Ҫ����summary��ת¼���������������Ҫ��װR���л���������Rscript����
echo �����������
pause >nul
goto menu
) else if "%choice%"=="3" (
    exit
) else (
    echo ��Ч��ѡ����������롣
    pause
    goto menu
)