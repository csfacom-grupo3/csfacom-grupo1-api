# Portal LEDES API

Para rodar a API do Portal LEDES é necessario seguir alguns passo:

- [Instalação do ruby](#ruby-install)
- [Instalação das dependencias](#dependency-install)
- [Criação do banco](#create-database)
- [Rodar a aplicação](#run-app)

<h2 id="ruby-install"> Instalação do ruby </h2> 

Para esse passo, vamos utilizar a ferramente [RVM](https://rvm.io/)(Ruby Version Manager)

> Caso você não tenha o `gpg2` que é requerido para instalar o RVM, consunte este [link](https://blog.programster.org/ubuntu-install-gpg-2)

Os seguintes comandos foram retirados do site do RVM:

- Para adicionar o RVM ao seus pacotes do Ubuntu: 
  -  ```bash
      gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
      ```

- Para instalar o RVM com uma versão padrão do Rails, framework usado no desenvolvimento :
  - ```bash
    \curl -sSL https://get.rvm.io | bash -s stable --rails
    ```

Pronto, o RVM já está pronto.

Após clonar o repositório em sua máquina, vá ate o root do projeto e rode :

```bash
rvm install 'ruby-3.1.3'
```

e por último, para setar a versão do ruby no RVM, use o seguinte comando :

```bash
rvm use
```

<h2 id="dependency-install"> Instalação das dependencias </h2>

O gerenciador de pacotes do Rails é o [Bundler](https://bundler.io/), para instalar as dependencias do projeto, rode :

```bash
bundle install
```

Caso queira adicionar alguma dependência ao projeto, adicione a dependica no `Gemfile` e depois rode o comando acima novamente, caso queira adicionar usando o proprio Bundler use :

```bash
bundle add 'nome_da_gem'
```

<h2 id="create-database"> Criação do banco e migração do banco </h2>

Antes de criar o banco de dados, precisamos garantir que o  `config/database.yml` esteja criado e configurado de acordo com o local que a aplicação vai rodar.

Temos um template de variáveis necessárias para poder criar o banco no arquivo `config/database.example.yml`, a partir da raiz do projeto, rodemos o seguinte comando para copiar o exemplo no arquivo de configuração :

```bash
cp ./config/database.example.yml  ./config/database.yml
```

Isso vai gerar o arquivo `./config/database.yml`, para desenvolvimento, podemos alterar esse arquivo manualmente, para ambientes de Homologação ou de Produção, este arquivo ja suporta configuração via `.env` :

- MYSQL_DB_HOST 
- MYSQL_ROOT_NAME
- MYSQL_ROOT_PASSWORD

Após configurar seu `config/database.yml` e o `.env` (opcional) vamos criar de fato o banco de dados utilizando do próprio framework, no root do projeto, rodaremos o seguinte comando: 

```bash
rails db:create
```

Depois de criar o banco, devemos migrar ele, através do comando :

```bash
rails db:migrate
```

Logo após o migrar o banco, poderemos popular ele através do comando :

```bash
rails db:seed
```

esse comando roda o arquivo `db/seeds.rb` que popula algumas entidades do banco que foram sugeridas no trabalho.



<h2 id="run-app"> Inicialização </h2> 

Para rodar a aplicação é bem simples, após realizar todos os passos anteriores, basta rodar:

```bash
rails server
```

e pronto, a aplicação estará disponível na porta 3000

