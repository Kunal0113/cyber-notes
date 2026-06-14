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

**My Experience:** This level is to good and vary intersting. when I see so many files after entering command i got hang for minute that i check evary file but i learn about human radble files and after that i crcak the password.

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