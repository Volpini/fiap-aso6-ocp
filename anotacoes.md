# fiap-aso6-ocp
Repositório para criação de infra no OpenShift

## Configurando o OpenShift Client para gerenciar os projetos
Copiar o oc.exe para dentro do `C:/Windows/System32` para invocar o comando `oc` de qualquer diretório ou configure o executável no PATH do Windows.

## Login no cluster criado
`oc login -p 133ffb462bba4879bed8 -u lgemhe https://api.na46.prod.nextcle.com:6443`

## Criar projeto
`oc new-project <projeto>`

## Projeto do GIT
https://github.com/openshift-katacoda/blog-django-py.git

Img registry: image-registry.openshift-image-registry.svc:5000/fiap-aso-bvolpini/blog-django-py-git@sha256:101966a251f2260bd8f5bb69e605ecda3addc0b0a65be10564714cf164c4f4e0
image-registry.openshift-image-registry.svc:5000/fiap-aso-bvolpini/blog-django-py-git:latest

## Listar projetos
`oc projects`

## Entrar / selecionar projeto
`oc project <project>`

## Listar todos os deployments
`oc get deployment`

## Criar recurso de HPA (Horizontal POD Autoscaler)
`oc create -f hpa/blog-django-py-git-hpa.yml`
ou
`oc create -f https://raw.githubusercontent.com/Volpini/fiap-aso6-ocp/main/hpa/blog-django-py-git-hpa.yml`

## Criar database PostgreSQL
`oc new-app postgresql-persistent --name sample-database --param DATABASE_SERVICE_NAME=sample-database --param POSTGRESQL_USER=sampledb --param POSTGRESQL_PASSWORD=sampledb --param POSTGRESQL_DATABASE=sampledb`

```
Username: sampledb
Password: sampledb
Database Name: sampledb
Connection URL: postgresql://sample-database:5432/
```

## Adicionar env a um deployment
`oc set env deployment blog-django-py-git DATABASE_URL=postgresql://sampledb:sampledb@sample-database:5432/sampledb`

