@echo off
echo ========================================
echo Git Remote URL ni o'zgartirish
echo ========================================
echo.

cd /d "C:\Users\Amir\Desktop\dars_project.2"

echo Hozirgi remote URL:
git remote -v
echo.

echo Remote URL ni yangilash...
git remote set-url origin https://github.com/usnatdinov02/shoponline.git
echo.

echo Yangi remote URL:
git remote -v
echo.

echo ========================================
echo Tayyor! Endi VS Code da commit qiling
echo ========================================
pause
