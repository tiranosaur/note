install msys2


C:\msys64\usr\bin\bash.exe --login -i


jetbrains: settings -> version controle-> git -> C:\msys64\usr\bin\git.exe


C:\msys64\usr\bin\bash.exe --login -i -c "cd /c && exec bash"


# Export system vars
```
export -p > env_vars.sh
source env_vars.sh
```
