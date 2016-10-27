Mémo pour GIT
=============

Eviter de mettre son mot de passe à chaque `git push`
-----------------------------------------------------

2 manières. Une qui me parait plus secure :

	git config credential.helper store
	git config --global credential.helper 'cache --timeout 7200'

La commande "git push" prompte le user/password la première fois et 
garde en cache mémoire.

L'autre plus radicale, mettre dans le fichier `~/.netrc`:

	machine github.com
       login <user>
       password <password>

A minima, passer la commande :

	chmod 600 ~/.netrc

Avec `git remote -v`, on peut vérifier que tout est bien ok.

Faire le ménage dans ses branches mergées:
------------------------------------------

	git branch # pour les lister
	git branch -d <nom branche> # pour les noms locaux
	git push orgin :<nom branche> # pour supprimer dans github (origin le repo GIT)


