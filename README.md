# Docs Docker
**Docs Docker** is a collection of documents in many programming languages by Docker.

You can open the documents locally without internet

A list of documents
- Python via `http://127.0.0.1:5000/docs/python`
- OpenTSDB via `http://127.0.0.1:5000/docs/opentsdb`

## Build & run
```
$ docker build -t mildronize/docs-docker .
$ docker run -d --name docs -p "5000:80" mildronize/docs-docker
```

## To do
- Add Docker documents
- Use [Alpine base](https://github.com/smebberson/docker-alpine) instead Debian
