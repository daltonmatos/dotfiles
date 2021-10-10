
#Após o primeiro clone

 - `git submodule init`
 - `git submodule update`


#Instalando o dotfiles

Instale o [dotbot](https://github.com/anishathalye/dotbot) com `pip install --user dotbot`

Depois rode:

```
$ dotbot -c install.conf.yaml
```

isso criará todos os symlinks necessários.


# Instalando os plugins do vim

Basta rodar `vim +PluginInstall +qa`
