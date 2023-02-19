#! /bin/bash
eval 'ssh agent -s' && ssh-add ~/.ssh/.chave_gitea
git add ./*
echo "Insert git commit message and press enter"
read mensagem
git commit -am "$mensagem"
read -n1 -p "Do you want to push the website changes to main? [y/n]" fazer
case $fazer in
	y|y) git push;;
	n|N) echo "not pushed";;
esac
rm -dr /home/merico/Lets_Encrypt/config/www/*
hugo && cp -r public/* /home/merico/Lets_Encrypt/config/www/
ssh-add ~/.chave_rsync
rsync -rtvzP public/* rsync@mateusbernardo.xyz:/var/www/blog/
