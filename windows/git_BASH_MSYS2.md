install msys2


C:\msys64\usr\bin\bash.exe --login -i


jetbrains: settings -> version controle-> git -> C:\msys64\usr\bin\git.exe


C:\msys64\usr\bin\bash.exe --login -i -c "cd /c && exec bash"


# Export system vars
```
echo $PATH > path.txt
export PATH=$(cat path.txt)
export PATH=$PATH:/c/Program\ Files/Maven/apache-maven-3.9.8/bin
```
