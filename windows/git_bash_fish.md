# Using fish shell with git bash on windows

To install [fish shell](https://fishshell.com/) on windows the options are:
- Cygwin
- WSL
- MSYS2

Since git bash is based on MSYS2 it seems a good fit to install fish. The problem is that git bash is a lightweight version of MSYS2 which does not include [`pacman`](https://www.msys2.org/docs/package-management/) as a package management, used to install fish.

[This OS thread](https://stackoverflow.com/questions/32712133/package-management-in-git-for-windows) has great suggestions on how to solve this problem including using the full MSYS2. But the best solution for me was this [answer](https://stackoverflow.com/a/65204171/4524171) by [Michael Chen](https://stackoverflow.com/users/7902054/michael-chen) which installs `pacman` on git bash.

I'll reproduce here his answer with some updates that made it work for me:

## Step 1

Download [pacman](https://packages.msys2.org/package/pacman?repo=msys), [pacman-mirrors](https://packages.msys2.org/package/pacman-mirrors?repo=msys) and [msys2-keyring](https://packages.msys2.org/package/msys2-keyring?repo=msys) from MSYS2's site. Also, for fish to work it is necessary download [gcc-libs](https://packages.msys2.org/package/gcc-libs?repo=msys&variant=x86_64) since uses `msys-stdc++-6.dll`.

The files are in the `zst` format. To decompress to `tar` format download the windows version of the [`zstd` tool](https://github.com/facebook/zstd/releases) and execute these commands from cmd:

```sh
zstd.exe -d msys2-keyring-1_20210213-2-any.pkg.tar.zst
zstd.exe -d pacman-mirrors-20210423-2-any.pkg.tar.zst
zstd.exe -d pacman-6.0.0-2-x86_64.pkg.tar.zst
zstd.exe -d gcc-libs-10.2.0-1-x86_64.pkg.tar.zst
```

## Step 2

From git bash root unpack the tar files and restore the packages. It can be necessary to open git bash as admin.

```sh
cd /
tar -xvf ~/Downloads/msys2-keyring-1_20210213-2-any.pkg.tar
tar -xvf ~/Downloads/pacman-mirrors-20210423-2-any.pkg.tar
tar -xvf ~/Downloads/pacman-6.0.0-2-x86_64.pkg.tar
tar -xvf ~/Downloads/gcc-libs-10.2.0-1-x86_64.pkg.tar
pacman-key --init
pacman-key --populate msys2
pacman -Syu
```

## Step 3

To sync the metadata files it's needed to run the commands below. This step takes some minutes to finish.

```sh
URL=https://github.com/git-for-windows/git-sdk-64/raw/main
cat /etc/package-versions.txt | while read p v; do d=/var/lib/pacman/local/$p-$v;
 mkdir -p $d; for f in desc files install mtree; do curl -sSL "$URL$d/$f" -o $d/$f;
 done; done
```

## Step 4

Now that `pacman` is installed on git bash, fish can be installed:

```sh
pacman -S fish
```

## Step 5

If all is well and working fine edit the file `~/.bashrc` adding these lines to make fish as the default shell:

```
if [ -t 1 ]; then
exec fish
fi
```
