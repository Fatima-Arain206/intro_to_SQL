# MyDatabaseProject (SQL Project Build + Deployment Guide)

This subfolder is a SQL project (dacpac workflow) used to package database objects for repeatable deployment.

## Build
```bash
dotnet build
```

What this does:
1. Validates project SQL definitions.
2. Produces a `.dacpac` artifact.

## Publish (example)
```bash
sqlpackage /Action:Publish /SourceFile:bin/Debug/MyDatabaseProject.dacpac /TargetServerName:localhost /TargetDatabaseName:MyDatabaseProject
```

Line-by-line:
1. `/Action:Publish` compares source model with target DB.
2. `/SourceFile` points to built dacpac.
3. `/TargetServerName` and `/TargetDatabaseName` set destination.

## Good practices
- Keep seed scripts idempotent where possible.
- Review publish drift report before production deploy.
- Store secrets in secure pipeline variables, never in repo text.

## Exercises
1. Add a new table script and rebuild.
2. Run publish to local DB and verify object creation.
