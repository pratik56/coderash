@echo off
for /R %%f in (*.java) do (javac "%%f")
for /R %%f in (*.java) do (java "%%~nf")