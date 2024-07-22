# setupvim
This is the setUp of neovim , from various resources ,like utube and git pages

vim - normal
<img width="1470" alt="Screenshot 2024-07-22 at 6 53 29 PM" src="https://github.com/user-attachments/assets/8ffb2b4a-22bc-4d18-94b5-7fa5a98d4d2e">


nvim after this process , this process is best for linux and mac os 
<img width="1470" alt="Screenshot 2024-07-22 at 6 51 48 PM" src="https://github.com/user-attachments/assets/69db0ddc-e36f-4741-9880-8303d6b5d041">
Let us first clone the the git hub repo 
```
git clone https://github.com/sowhatnowgithub/setupvim.git
cd setupvim
```

give executable permsissions to the file "setUp.sh" and execute the file
```
chmod +x setUp.sh
./setUp.sh
```
we have to use press the following commands to install all the plugin and dependencoes 

like this default has gopls which an lsp for go , hence u will be prompted to install few and ripgrep a powerful tool to acces file system
1.neovim
2.go (cmp-lsp) NOTE: go is 500MB , remaing all are light , The process won't be bothered even if u don't install , press continue if waring comes ,
3.gopls (this is installed through go , through mason-nvim plugin, if u don't want to install go , then this will not be needed , this is an language server protocol for lsp)
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
:q
:q
```
redo the process , that is press the above two commands again separately again , to be sure the final installation is done
In second time , enter the following
At any point if mason troubles that means , mason-nvim is showing trouble to me , maybe I configurd wrong 
```
:MasonUpdate  
```
Now , to activate the most of the features 

```
ctrl+\ to open the terminal resize the window
:NvimTreeOpen
```

I think this would allow the best vim , plugins

P.S :

There might be bugs in the script.
