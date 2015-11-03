### Rails basic commands

Start a new app
```
$ rails new my_app
```

Running the server
```
$ rails server
$ rails s
```

Running console
```
$ rails console
$ rails c
```

Exiting from console or server with `ctrl+c`

### Less words, hands on our first app

The challenge:

_Build a 9gag like app in less than 30 min_

Database model:
```
  gag:
    title:string
    media_file:string
    votes_count:integer
    comments_count:integer
    author_id:integer
  vote:
    gag_id:integer
    user_id:integer
  comment:
    gag_id:integer
    content:text
    author_id:integer
```