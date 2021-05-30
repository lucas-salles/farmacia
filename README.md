# Módulo Farmácia

## Rodando o Projeto Localmente

```bash
# Levantar módulo farmácia
$ docker-compose up -d

# Criar banco
$ docker-compose run web rake db:create

# Rodar migrações
$ docker-compose run web rake db:migrate

# Popular banco
$ docker-compose run web rake db:seed

# O servidor inciará na porta:3001 - acesse <http://localhost:3001>
```
