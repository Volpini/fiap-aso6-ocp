# fiap-aso6-ocp
Repositório para criação de infra no OpenShift

## Configurando o OpenShift Client para gerenciar os projetos

Copiar o oc.exe para dentro do `C:/Windows/System32` para invocar o comando `oc` de qualquer diretório ou configure o executável no PATH do Windows.

## Login no cluster criado

`oc login -p 133ffb462bba4879bed8 -u lgemhe https://api.na46.prod.nextcle.com:6443`

## Criar projeto

`oc new-project <projeto>`

## Projeto do blog GIT

https://github.com/openshift-katacoda/blog-django-py.git

# Criando o ambiente do zero no Openshift

Antes de iniciar o processo, é necessário criar o projeto `fiap` no OpenShift. Isso pode ser feito através do comando `oc new-project` ou através do console web do cluster.

Após isso ser feito, basta selecionar o projeto `fiap` no Openshift client com o comando `oc project fiap`.

Para criar toda a infra, é só executar o comando `oc apply -k ./<diretorio_raiz_repositorio>` (ex.: `oc apply -k ./fiap-aso6-ocp`).
Esse comando precisa indicar o diretório onde o arquivo `kustomization.yml` está. 

Após realizado o comando, os recursos no cluster k8s serão provisionados automaticamente. Para acessar a aplicação do Blog, basta acessar o console web do cluster, ativar o modo administrador, navegar até Network -> Routes e acessar o endereço presente na coluna "Location" do registro `blog-ingress`.

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

