# Bandit Wargame Notes

## Level 0 — Logging In
**Goal:** SSH into the game server.
**Command:**
```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
# password: bandit0
```
**What I learned:**
- SSH (Secure Shell) is used to remotely connect to servers
- `-p 2220` specifies a custom port (default SSH port is 22)

**My Experience:** This is starting and i am nervous and vary excited for starting it, i got stuck in some part but that was good and when i enter the ssh command and password i was vary happy.

---

## Level 0 → 1
**Goal:** Find password stored in a file called `readme` in home directory.
**Command:**
```bash
ls        # list files
cat readme  # read the file
```
**What I learned:**
- `ls` lists files in current directory
- `cat` prints file contents to terminal

**My Experience:** this was first level of bandit, and i was little confused about commands and stuck for around 8-9 minutes but when i get the password i get another level of satisfaction. 

---

## Level 1 → 2
**Goal:** Password is in a file called `-` (dash filename).
**Command:**
```bash
cat ./-
```
**What I learned:**
- Files named `-` can't be read with just `cat -` (treated as stdin flag)
- Use `./` prefix to tell Linux "this is a file, not a flag"

**My Experience:** This level i feel vary tough because of flag because avary time i enter "-" the terminal got confuesd and gives error but i understand some things from google then complete the level and get password.

---

## Level 2 → 3
**Goal:** Password is in a file called `spaces in this filename`.
**Command:**
```bash
cat "spaces in this filename"
# or
cat spaces\ in\ this\ filename
```
**What I learned:**
- Filenames with spaces need quotes or backslash escaping
- Tab autocomplete in terminal handles this automatically

**My Experience:** In this level i learned a lot from spacing concepts in terminal and so many things. 

---

## Level 3 → 4
**Goal:** Password is in a hidden file inside `inhere/` directory.
**Command:**
```bash
cd inhere
ls -la        # show hidden files
cat ...Hiding-From-You
```
**What I learned:**
- Hidden files start with `.` in Linux
- `ls` won't show them — use `ls -a` or `ls -la`
- `-l` gives detailed view, `-a` shows hidden files

**My Experience:** This level was so intersting i find the hiiden file but confuesd in opening it but after getting stuck for some time i get the password and crack it.

---

## Level 4 → 5
**Goal:** Only one file in `inhere/` is human-readable. Find it.
**Command:**
```bash
cd inhere
file ./-file0*    # check file types
cat ./-file07     # the human-readable one
```
**What I learned:**
- `file` command tells you what type a file is (ASCII, binary, etc.)
- Human-readable = ASCII text
- `*` wildcard runs command on all matching files at once

**My Experience:** This level was good and very interesting. When I saw so many files after entering the command, I was stuck for a minute — I thought I'd have to check every file manually. But I learned about human-readable files, and after that, I cracked the password easily.

---

## Level 5 → 6
**Goal:** The password is stored in the `inhere/` directory. The file has these properties: human-readable, 1033 bytes in size, and not executable.

**Command:**
```bash
cd inhere
find . -size 1033c -type f ! -executable    # check size, type, and not executable
cat <result_path>     # print the matching file
```

**What I learned:**
- `find` can combine multiple conditions (`-size`, `-type f`, `! -executable`) in one command — no need to run them separately.
- The `c` suffix in `-size` means bytes. Without it, `find` assumes 512-byte blocks, which gives the wrong size.
- `! -executable` (note the dash before `executable`) excludes executable files from the results.

**My Experience:** In this level, I got stuck on `-size` multiple times because I used `1033b` instead of `1033c`. Once I learned the difference between blocks and bytes, I found the file and got the password.

---

## Level 6 → 7
**Goal:** The password is stored somewhere on the server. The file has these properties: owned by user `bandit7`, owned by group `bandit6`, and size 33 bytes.

**Command:**
```bash
find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
# search whole filesystem for a file owned by user bandit7, group bandit6, exactly 33 bytes
# 2>/dev/null hides "permission denied" errors so output stays clean
cat <result_path>   # print the password
```

**What I learned:**
- Can search the entire filesystem starting from `/` using `find /`.
- `find` can combine `-user`, `-group`, and `-size` together to narrow results across the whole system.
- `2>/dev/null` redirects error output (stderr) to a "black hole" so permission-denied messages don't clutter the terminal.

**My Experience:** In this level, I forgot to add `/` after `find`, and when I ran the command it gave nothing. After a moment it clicked — I added the `/` and the command worked.

---


## Level 7 → 8
**Goal:** The password is stored in the file `data.txt`, next to the word `millionth`.

**Command:**
```bash
grep "millionth" data.txt   # grep searches for the word "millionth" in data.txt
```

**What I learned:**
- We can search for a specific word in a file using `grep`.
- `grep` syntax is `grep "pattern" filename` — the search term comes first, then the file name.

**My Experience:** At the start, I used the wrong command, like `find data.txt | grep "millionth"`, but that gave nothing. Then I tried using just `grep`, but I forgot the correct syntax and wrote `grep data.txt "millionth"`. After being stuck for a bit, I used `grep "millionth" data.txt` and got the password.

---

## Level 8 → 9
**Goal:** The password is stored in the file `data.txt`, and we need to find the only line of text that occurs just once.

**Command:**
```bash
man sort
man uniq
# used to check which flags `sort` and `uniq` need for this task

sort data.txt | uniq -u   
# sort arranges the data in ascending order, then `uniq -u` picks out the line(s) that appear only once
```

**What I learned:**
- With the help of `man`, we can check the available flags for any command.
- `sort` helps us sort data, which is often a prerequisite for using `uniq` properly.
- `uniq -u` helps us identify lines that are unique (appear exactly once).
- **Important:** `uniq` only detects duplicate lines if they are **adjacent** (next to each other). It does NOT scan the whole file for duplicates — it just compares each line to the one right before it. So if the same line appears at the top and bottom of an unsorted file, `uniq` won't catch it as a duplicate.
- That's why `sort` is used **before** `uniq` — sorting brings all identical lines together, so `uniq` can correctly find duplicates (or in this case, the one line with no duplicates at all).

**My Experience:** In this level, I got confused about which flags to use, but the `man` command helped me a lot. It also helped me understand exactly what each command does and how its options change its behavior. I also learned that `uniq` alone isn't enough — without sorting first, it can give wrong results since it only checks neighboring lines.

---

## Level 9 → 10
**Goal:** The password is stored in the file `data.txt`, in one of the few human-readable strings, preceded by several '=' characters.

**Command:**
```bash
man strings    # learn what `strings` is used for.
strings data.txt | grep "=="   # `strings` finds the human-readable data in the file, then `grep` prints the lines preceded by '==' characters.
```

**What I learned:**
- `strings` can identify data that is in human-readable form within a file.

**My Experience:** At first, I was a little confused about `strings`, but I figured it out later. I initially tried `strings <filename>`, but I got a lot of different/unrelated data. Then it clicked — I needed to use `grep` to filter it down.

---

## Level 10 → 11
**Goal:** The password is stored in the file `data.txt`, and it is in base64-encoded data format.

**Command:**
```bash
man base64    # To find out which flag to use.
base64 -d data.txt   # `base64` is used to encode or decode data; here, the -d flag is used to decode the data.
```

**What I learned:**
- Learned about base64 and encoded/decoded data.
- `base64` is used to encode or decode data.

**My Experience:** At the start of this level, I only used `base64` without any flag, because I thought `base64` didn't have any flags. After entering the command, I got a lot of encoded data and was shocked. Then I tried the `man` command to learn more about `base64`, and that's when I discovered the `-d` flag, which is used for decoding. In the end, I got the password.

---

## Level 11 → 12
**Goal:** The password is stored in the file `data.txt`, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.

**Command:**
```bash
man tr    # To know how `tr` works.
cat data.txt | tr "A-Za-z" "N-ZA-Mn-za-m"   # `cat` pipes the file into `tr`, then "A-Za-z" "N-ZA-Mn-za-m" are the two sets used for ROT13.
```

**What I learned:**
- `tr` doesn't take a filename as an argument; it only reads from standard input (or a pipe).
- `"A-Za-z"` is the set that tells `tr` to treat A-Z as uppercase and a-z as lowercase.
- `"N-ZA-Mn-za-m"` is the set used for rotating each letter by 13 positions, following the ROT13 logic.
- This level taught me how ROT13 works.

**My Experience:** This level was very interesting, and I learned a lot from it — especially how ROT13 works. I got a syntax error at first, but the terminal didn't tell me what was wrong. After doing some research on `tr`, I understood the issue, and then I cracked the level with the correct command.

---

## Level 12 → 13
**Goal:** The password is stored in the file `data.txt`, which is a hexdump of a file that has been repeatedly compressed.

**Command:**
```bash
mktemp -d                          # Create a temporary directory in /tmp.
cp data.txt /tmp/tmp.gGiaKObiFe        # Copy the file into the temporary directory.
cd /tmp/tmp.gGiaKObiFe                 # Change into that directory.
xxd -r data.txt > data.bin         # Revert the hexdump back into a binary file.
file data.bin                      # Check what type of compression was used.
mv data.bin data.gz                # Rename the file with the correct extension (based on what `file` reports).
gunzip data.gz                     # Extract the gzip-compressed data.
bunzip2 data.bz2                   # Extract the bzip2-compressed data.
tar -xf data.tar                   # Extract the tar archive.
cat data                           # Open the final file to see the password inside.
```

**What I learned:**
- `mktemp -d` is very useful when we want to create a temporary directory inside `/tmp`, so we don't clutter the home directory while working with intermediate files.
- Commands like `gunzip` and `bunzip2` expect the correct file extension to work properly — `.gz` for `gunzip` and `.bz2` for `bunzip2`. If the extension doesn't match, the command will throw an error, so you need to rename the file accordingly before running it.
- `tar -xf` is used to extract a tar archive file.
- The `file` command is very useful for identifying file information, like type, size, etc. — this is what told me which decompression command to use at each step.

**My Experience:** Honestly, this was the toughest level out of all the Bandit levels I've solved so far (1 to 12). I felt pretty confused at first, since the file kept changing type after every decompression step, and I had to repeat the process — `file`, rename, then decompress — multiple times before reaching the final result. But I actually enjoyed the process a lot. Every time I decompressed a layer, it felt like a small win, and it made me curious about what the next layer would be. This level took a lot more time than the others, but the satisfaction at the end made it worth it.

---

## Key Commands So Far
| Command | What it does |
|---------|-------------|
| `ssh user@host -p PORT` | Connect to remote server |
| `ls` | List files |
| `ls -la` | List all files including hidden |
| `cat filename` | Read a file |
| `cd foldername` | Change directory |
| `file filename` | Check file type |
| `pwd` | Show current directory path |
| `find / -size SIZEc` | Find files of a specific size (in bytes) across the filesystem |
| `find / -user USERNAME` | Find files owned by a specific user |
| `find / -group GROUPNAME` | Find files owned by a specific group |
| `man COMMAND` | Show the manual/help page for a command |
| `strings filename` | Extract human-readable strings from a file |
| `grep "pattern" filename` | Search for lines matching a pattern in a file |
| `base64 -d filename` | Decode base64-encoded data |
| `tr "SET1" "SET2"` | Translate or substitute characters (e.g. used for ROT13) |
| `mktemp -d` | Create a temporary directory in `/tmp` |
| `cp source destination` | Copy a file from one location to another |
| `mv source destination` | Move or rename a file |
| `xxd -r filename` | Revert a hexdump back into binary form |
| `gunzip filename.gz` | Extract gzip-compressed data |
| `bunzip2 filename.bz2` | Extract bzip2-compressed data |
| `tar -xf filename.tar` | Extract a tar archive |