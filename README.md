# A Vapor Starter Template

This can be instanciated from GitHub (Use this template button) or via vapor's CLI command with the --template option.

## Customize Project

Change the following files:

```bash
sed -i .bak -e 's/CardsTracker/VaporTemplate/g' README.md
sed -i .bak -e 's/CardsTracker/VaporTemplate/g' Package.swift
sed -i .bak -e 's/CardsTracker/VaporTemplate/g' docker-compose.yml
```

The source is ready to add your models, migrations and controllers:

```
Sources/App/Models/
Sources/App/Migrations/
Sources/App/Controllers/
```

## Heroku Support

```bash
heroku git:remote -a <appname>
```

Edit the _Procfile_ to choose your workers. Setup buildpack in Heroku to:

```
https://github.com/vapor-community/heroku-buildpack
```

Set the following config option (work-around for Linux test files issue):

```
SWIFT_BUILD_FLAGS="--enable-test-discovery"
```
