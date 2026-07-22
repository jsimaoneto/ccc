@echo off
chcp 65001 >nul
setlocal
cd /d "D:\Claude\site-ccc"

echo ==================================================
echo   PUBLICAR SITE - Centro Clinico Campolim
echo   https://jsimaoneto.github.io/ccc/
echo ==================================================
echo.

git add -A
git diff --cached --quiet
if %errorlevel%==0 (
  echo Nada mudou desde a ultima publicacao. Nao ha o que enviar.
  echo.
  echo Dica: salve as fotos novas na pasta "imagens" antes de publicar.
  echo.
  pause
  exit /b 0
)

echo Enviando as alteracoes para o site...
echo.
git commit -m "Atualizacao do site em %date% %time%"
git push origin main

if %errorlevel%==0 (
  echo.
  echo ==================================================
  echo   SITE ATUALIZADO COM SUCESSO
  echo   https://jsimaoneto.github.io/ccc/
  echo   A mudanca aparece online em 1 a 2 minutos.
  echo ==================================================
) else (
  echo.
  echo ==================================================
  echo   OCORREU UM ERRO AO ENVIAR
  echo   Verifique a conexao com a internet e tente de novo,
  echo   ou me chame no Claude para resolver.
  echo ==================================================
)

echo.
pause
endlocal
