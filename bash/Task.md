### Linux tasks
-	Find all system groups and get only its unique names & id.
cut -d: -f '1 3' /etc/group | sort
-	Find all files & directories that have access rights for relevant user & group.
ls -l
-	Find all scripts in the certain directory and its subdirectories
find . -type f -name "*.sh"
-///	Do the script files searching from certain user.
-///	Do recursive words or phrase searching for certain file types. Find files duplicates in the certain catalogues. Firstly, compare by the size, then by variant (choose hash-function: CRC32, MD5, SHA-1, sha224sum). Result must be sorted by the name of the file.
-	Find all symbolic links on the file by its name and path.
 find -L / -samefile ./scripts/s4.sh
find . -lname file
find ./ -type l -print0 | xargs -0 ls -plah
-	Find all hard links on the file by its name and path.
 find . -samefile ./scripts/s1.txt
-///	Delete file in correct way considering hard or symbolic links existing.
-	Change access rights for the file in the certain directory.
find /path -type d -exec chmod permission {} \;
chmod permission -R  /path

-///	Do recursive comparing of 2 directories and print only different files. (print before 2d string and after 3d string relatively the string where differents were found).
-	Print active network connections list.
netstat -l
-	Remap existing symbolic link.
ln -sfn /a/new/path files
-	Find all broken links and delete them.
 find -L . -type l -delete
-	Unpack from the archive tar, bz2, lz, lzma, xz, Z certain catalogue to the certain place.
tar -xvf .tar /catalog -C /path
unzip, unrar
-	Make recursive copy of catalogue structure from the certain directory. (without files).
cp -a tree_catalog reserve_catalog
-	Print all system users list (only names) by the alphabet.
cut -d: -f1 /etc/passwd | sort
-///	Print all system users list (only names) by the id.
-	Download all links from the web-site. (parallel).
wget -I URL
-	Stop all processes that are working more than 5 days. Don't use ps command.
killall -u $USER --older-than 5d commadnname