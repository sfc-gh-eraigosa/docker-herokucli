# Another docker-herokucli

[![](https://travis-ci.com/wenlock/docker-herokucli.svg?branch=master)](https://travis-ci.com/wenlock/docker-herokucli)

Lets build another heroku cli tool for docker so we can hack. :tada:

## Using the image
Here is some instructions on how to use it.

### Use it

For example:

```
eval $(docker run --rm wenlock/herokucli:latest init)
heroku help
```

## Local Development

### Build it
`make build`

### Test it
```
eval $(docker run --rm wenlock/herokucli:latest init)
heroku test
```

### Shell
Start a shell with
```
eval $(docker run --rm wenlock/herokucli:latest init)
heroku shell
```

## Contributing to docker-herokucli

Want to help me, wow cool!  

Fork this repo and submit a PR :D

## Licensing
[MIT](LICENSE)
