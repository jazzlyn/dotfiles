alias pacman-aur='pacman -Qm'
alias pacman-local='pacman -Qe'
alias pacman-all='comm -23 <(pacman -Qeq | sort) <(pacman -Qgq | sort)'
alias pacman-autoremove='sudo pacman -R $(pacman -Qtdq)'
alias pacman-clearcache='sudo pacman -Scc'
