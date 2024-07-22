# setupvim
This is the setUp of neovim , from various resources ,like utube and git pages
Let us first clone the the git hub repo 
```

```

give executable permsissions to the file "setUp.sh" and execute the file
```
chmod +x setUp.sh
./setUp.sh
```
we have to use press the following commands to install all the plugin and dependencoes 
like this default has gopls which an lsp for go , hence u will be prompted to install few and ripgrep a powerful tool to acces file system
1.neovim
2.go (cmp-lsp)
3.ripgrep (telescope)

Note: there are issues with bufferline , but don't worry press enter if the error shows , main functionality is not bothered ny this

Now , with succesful installtion of all the requirements
Let's us do the final installation

press  the following command
```
nvim
```

enter the noraml mode , and enter : and type the following
```
:PackerSync
:wq
```
redo the process , that is press the above two commands again separately again , to be sure the final installation is done


Now , to activate the most of the features 
```
ctrl+\ to open the terminal resize the window
:NvimTreeOpen
```

I think this would allow the best vim , plugins
P.S :
There might be bugs in the script.
