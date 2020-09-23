## Antes de qualquer execução, existem alguns requisitos que devem ser obedecidos:

### INSTRUÇÕES PARA CONFIGURAÇÃO

1.  As informações no arquivo de configuração (/system/config/settings.yml) devem estar preenchidas.

```
url: caminho inicial do sistema
log_file_path: nome da pasta onde serão criadas as pastas com evidências
project_code: código do projeto
project_name: nome do projeto
save_evidences: define se as evidências serão salvas ou não (on/off)
```

2. Você deve editar a variável de sistema **Path** e adicionar o diretório onde estão os drivers do Chrome e Firefox. Esses drivers se encontram na pasta **drivers** na raiz desse projeto.


### INSTRUÇÕES PARA EXECUÇÃO

1. Primeiramente devemos instalar as **gems** necessárias para executar o projeto. Para isso, basta rodar o comando abaixo na pasta raiz do projeto.

```
bundle install
```

2. Após a instalação das gems, ainda na pasta raiz do projeto, podemos executar a feature com o comando abaixo:

```
cucumber features\store.feature
```

Versões utilizadas no desenvolvimento do projeto:

* cucumber 3.1.2
* ruby 2.6.5
* driver firefox 0.27.0
* driver Chrome 85.0.4183.87
* selenium-webdriver 3.142.6
