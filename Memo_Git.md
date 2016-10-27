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

Faire le m�nage dans ses branches merg�es:
------------------------------------------

	git branch #�pour les lister
	git branch -d <nom branche> #�pour les noms locaux
	git push orgin :<nom branche> # pour supprimer dans github (origin le repo GIT)


