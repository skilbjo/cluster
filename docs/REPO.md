## git
````
$ llcomputing $ git remote add pi ssh://skilbjo@skilbjo.duckdns.org:143/~/git/llcomputing.git
$ llcomputing $ git remote set-url --add --push pi ssh://skilbjo@skilbjo.duckdns.org:144/~/git/llcomputing.git
$ llcomputing $ git remote set-url --add --push pi ssh://skilbjo@skilbjo.duckdns.org:145/~/git/llcomputing.git
$ llcomputing $ git remote set-url --add --push pi ssh://skilbjo@skilbjo.duckdns.org:146/~/git/llcomputing.git

$ git commit -am 'push once; code deployed 4x'


$ git remote -v

$ origin	git@github.com:skilbjo/llcomputing.git (fetch)
$ origin	git@github.com:skilbjo/llcomputing.git (push)
$ pi	ssh://skilbjo@skilbjo.duckdns.org:143/~/git/llcomputing.git (fetch)
$ pi	ssh://skilbjo@skilbjo.duckdns.org:144/~/git/llcomputing.git (push)
$ pi	ssh://skilbjo@skilbjo.duckdns.org:145/~/git/llcomputing.git (push)
$ pi	ssh://skilbjo@skilbjo.duckdns.org:146/~/git/llcomputing.git (push)
````