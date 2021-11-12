@echo off
set PHYSICX=physicx
set TEMP=%PHYSICX%.xdv %PHYSICX%.aux %PHYSICX%.log %PHYSICX%.idx %PHYSICX%.ind %PHYSICX%.ilg %PHYSICX%.out %PHYSICX%.toc %PHYSICX%.glo %PHYSICX%.gls %PHYSICX%.hd %PHYSICX%.xsim %PHYSICX%.lmc

set TEX=lualatex
%TEX% %PHYSICX%.ins

set MODE=-interaction=nonstopmode -synctex=1 -file-line-error
set MAKEINDEX=makeindex
%TEX% %MODE% %PHYSICX%.dtx
%MAKEINDEX% -s gind.ist -o %PHYSICX%.ind %PHYSICX%.idx
%MAKEINDEX% -s gglo.ist -o %PHYSICX%.gls %PHYSICX%.glo
%TEX% %MODE% %PHYSICX%.dtx
%TEX% %MODE% %PHYSICX%.dtx
del %TEMP%

set TEX=xelatex
set PHYSICX=physicx-cn
set TEMP=%PHYSICX%.xdv %PHYSICX%.aux %PHYSICX%.log %PHYSICX%.idx %PHYSICX%.ind %PHYSICX%.ilg %PHYSICX%.out %PHYSICX%.toc %PHYSICX%.glo %PHYSICX%.gls %PHYSICX%.hd %PHYSICX%.xsim %PHYSICX%.lmc %PHYSICX%.listing
set NOPDFMODE=-interaction=nonstopmode -synctex=1 -file-line-error --no-pdf
set MODE=-interaction=nonstopmode -synctex=1 -file-line-error -pdf
%TEX% %NOPDFMODE% %PHYSICX%.tex
%MAKEINDEX% -s gind.ist -o %PHYSICX%.ind %PHYSICX%.idx
%MAKEINDEX% -s gglo.ist -o %PHYSICX%.gls %PHYSICX%.glo
%TEX% %NOPDFMODE% %PHYSICX%.tex
%TEX% %MODE% %PHYSICX%.tex
del %TEMP%
exit