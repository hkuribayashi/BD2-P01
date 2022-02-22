# BD2-P01


# Instruções de como rodar este exemplo

## Instalação de dependências 

### MySQL 

`mysql-server` é um programa gerenciador de Bancos de Dados.

Para "instalar" `mysql-server` no seu computador:

- Faça o download do `mysql-server` [aqui](https://dev.mysql.com/downloads/mysql/)
- Execute o arquivo de instalação
- Durante a instalação será pedido a configuração da senha do usuário `root`
  - Guarde a senha definida
- Verifique se o serviço do `mysql-server` está rodando na porta 3306

### Conda

`conda` é um programa que "monta e gerencia" ambientes, ele não requer privilégios administrativos e não "instala" nada no sistema anfitrião; deletar um ambiente do conda (ou `conda` inteiro) consiste em deletar um diretório.

Para "instalar" `conda` no seu computador:

- Faça o download do `miniconda` [aqui](https://docs.conda.io/en/latest/miniconda.html#linux-installers)
- Execute o script baixado
  - Opcional: modifique o "diretório de instalação"

No site [site oficial](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) há instruções detalhadas.

Após a instalação, feche o terminal e abra novamente.
Se tudo certo, o seu prompt deve estar prefixado com o nome de um ambiente, algo como:

`(base) user@computer:`

Execute o comando `conda config --set auto_activate_base false`, assim o conda não ira ativar o ambiente `base` toda vez que você abrir um terminal.
Feche o terminal e abra novamente. Se tudo deu certo, o prompt deve estar normal novamente (sem prefixos do `conda`).

### Sobre conda e miniconda

Um breve esclarecimento sobre nomes:
- `conda` é um programa que cria/gerencia ambientes e instala programas
- `miniconda` é um "combo" que contém: `conda` + dependências para rodar `conda`

Nós "instalamos" `miniconda` para executar o `conda`.

### Criando o ambiente

Com `conda` instalado, execute (na raiz do repositório) o comando:
`conda env create --name bd2 --file requirements.txt`

Esse comando criará um ambiente chamado `bd2` (você pode renomear se quiser) a partir da lista de pacotes/dependências enumeradas no arquivo conda_env.yaml (que está na raiz do repositório).

O ambiente é criado no "diretório de instalação" que você configurou durante a instalação do conda.

O resto deste texto assume que o nome do ambiente criado é `bd2`

### Ativando o ambiente

Toda vez que desejarmos executar o projeto, é necessário ativar o ambiente com o comando:
`conda activate bd2`


## Rodando o exemplo

python main.py



