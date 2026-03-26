

# WSL
WSL2's inotify limit:

Need this limit increased for nvim.roslyin lsp to work

need to edit .wslconfig with 
```
[wsl2]
kernelCommandLine = sysctl.fs.inotify.max_user_instances=524288

```

# GIT
inside of .gitconfig
```
[url "git@github.com:"]
    insteadOf = https://github.com/
```
forces use of ssh instead of https
