M�mo pour GIT
=============

Eviter de mettre son mot de passe � chaque `git push`
-----------------------------------------------------

2 mani�res. Une qui me parait plus secure :

	git config credential.helper store
	git config --global credential.helper 'cache --timeout 7200'

La commande "git push" prompte le user/password la premi�re fois et 
garde en cache m�moire.

L'autre plus radicale, mettre dans le fichier `~/.netrc`:

	machine github.com
       login <user>
       password <password>

A minima, passer la commande :

	chmod 600 ~/.netrc

Avec `git remote -v`, on peut v�rifier que tout est bien ok.

Reussite de g�n�ration d'un probl�me de conflit de fusion
---------------------------------------------------------
