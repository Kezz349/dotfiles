# Base de dotfiles — cours 05

Cette base correspond à l'atelier de dotfiles du cours 05. Copiez son contenu
dans `~/dotfiles`, puis suivez l'exercice pour intégrer chaque fichier sans
écraser une configuration déjà présente.

Depuis le dossier `05` du dépôt de cours, la copie se fait avec :

```sh
cp -a dotfiles-base/. "$HOME/dotfiles/"
```

Les fichiers sont volontairement sans plugiciel externe : ils doivent fonctionner
avec Bash ou Zsh, GDB, Neovim et une installation actuelle de VS Code C/C++.

Ne placez jamais de clé privée SSH, mot de passe, jeton ou fichier `~/.ssh` dans
ce dépôt.
