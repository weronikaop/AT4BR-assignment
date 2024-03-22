# AT4BR - exercise 4

***Weronika Oprzędek 21.03.2024***

## How to use git - a guide by me for me

### Connecting git to the computer

1. create ssh key
```
 ssh-keygen -t ed25519 -C "e-mail"
```

2. read the file with public key and add it in the settings of my git account

3. after creating repository on the account, clone it to the computer
```
git clone git@github.com:weronikaop/AT4BR-assignment.git
```

### Basic git commands
1. track file

```
git add name_of_file.txt
```

2. create a snapshot

```
git commit -m "a message to remember the version"
```

3. save in GitHub

```
git push origin branch_name
```

4. compare two saved versions

```
git diff version1 version2
```

5. synchronise the changes to a different computer

```
git pull
```

### Branches
1. Create branch
```
git branch name
```

2. Change current branch
```
git checkout name
```

3. Saving changes from a branch to main
```
git merge
```

- merging conflicts
    - possible if 2+ branches edited at the same time
    * don't happen if different parts of the file edited
    - should edit file to its proper form after a message about the conflict appears

:watermelon:
---