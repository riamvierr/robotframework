# SUMÁRIO
1. [Estrutura do projeto](#1-estrutura-do-projeto)
   * [1.1. Features](#11-features)
   * [1.1.1. A estrutura de suite de testes](#111-a-estrutura-de-suite-de-testes)
   * [1.2. Pages](#12-pages)
   * [1.3. Resources](#13-resources)
   * [1.4. Steps](#14-steps)

2. [Execução dos testes](#2-execucao-dos-testes)
   * [2.1. Pré-requisitos](#21-pre-requisitos)
     * [2.1.1. Linguagem](#211-linguagem)
     * [2.1.2. IDE](#212-ide)
     * [2.1.3. Variáveis de ambiente](#213-variaveis-de-ambiente)
     * [2.1.4. Robotframework](#214-robotframework)
     * [2.1.5. SeleniumLibrary](#215-seleniumlibrary)
   * [2.2. Executando testes automatizados](#22-executando-testes-automatizados)
     * [2.2.1. Suite de testes](#221-suite-de-testes)
     * [2.2.2. Comandos para execução dos testes](#222-comandos-para-execucao-dos-testes)
       * [2.2.2.1. Execução da suite de teste completa](#2221-execucao-da-suite-de-teste-completa)
       * [2.2.2.2. Execução de teste específica](#2222-execucao-de-teste-especifica)
       * [2.2.2.3. Execução de mais de um teste específico](#2223-execucao-de-mais-de-um-teste-especifico)

# Sobre
O projeto  é uma amostra prática do meu conhecimento técnico sobre a utilização do robotframework. 
Nele você encontrará alguma das técnicas que eu geralmente utilizo durante o meu processo de implementação de testes automatizados. Neste readme, você encontrará algumas explicações mais profundas sobre algumas decisões que tomei ao realizar as implementações conforme exibidas no repositório. 

Quaisquer feedbacks, estou a disposição!

# Testes automatizados utilizando robotframework

* [Robotframework](https://robotframework.org/)
* [Documentação Robot](https://docs.robotframework.org/docs)

### Requisitos para instalação ###

* [Python](https://www.python.org/)

### Entendendo o projeto  ###

 #### INTRODUÇÃO ####
 
Esse documento tem como objetivo detalhar e auxiliar os usuários da automação de testes nos sistemas implementados. O documento conta com tópicos informativos e de apoio para o melhor uso dos testes. 


## 1. Estrutura do projeto

O repositório possui a seguinte estrutura:
```	
	 Pasta raiz ¬ 
		1. Features ¬
			[...].robot
		2. Pages ¬
			[...].robot
		3. Resources ¬
			[...].robot
			[...].py
			4. Steps ¬
			[...].robot
```
	
A estrutura deve ser mantida dessa forma, e os arquivos dentro de cada pasta não devem ser movidos ou alterados, já que as referências entre eles seguem esse padrão de estrtutura. 
	
### 1.1. Features
Dentro da pasta features existe um arquivo .robot com o nome do fluxo implementado, o arquivo possui o BDD (Behavior Driven Development) de cada funcionalidade, que é o comportamento que o teste deve seguir.
```	
    Exemplo de BDD: 
		Login.robot ¬
		Given a user in login page
		When the user insert his credentials
		And press the login button
		Then the page must show a message based on user type of operaction
```
		
####		1.1.1. A estrutura da suíte de testes
A pasta feature é conhecida como suite de testes e cada arquivo contido nela representa o conjunto de comportamentos implementados de uma determinada funcionalidade. Um arquivo individual também pode ser considerado uma suite de testes, mas este é mais específico - falaremos mais sobre isso nos tópicos seguintes - dentro dos arquivos, cada teste possui um identificador. A tag é localizada logo após o identificador [TAGS] e são necessárias para a execução do teste automatizado de forma mais específica (verificar tópico 2.2).

 ``` 				
			Por exemplo:
			Login.robot ¬
			CT-001: [Login] - Successfully login
				[Tags]    CT-001    riam.lima
				Given a user in login page
				When the user insert his credentials    valid
				And press the login button
				Then the page must show a message based on user type of operaction
```

No caso acima, a tag do teste de Login com credenciais válidas é CT-001.
		
>Os arquivos NÃO devem ser alterados livremente, pois caso haja alguma alteração, é necessário refatoramento do código nas áreas afetadas pela mudança.*

>Em caso de alteração, contatar o desenvolvedor responsável para ajustes.* 
		
		
###	1.2. Pages
A pasta pages contém todo o mapeamento de elementos aos quais o teste automatizado interage (conhecidos como elementos de interação). Cada arquivo .robot possui o nome do fluxo a ser testado e em cada um destes arquivos está contido os identificadores dos elementos (xpaths, classes, id's e etc...) na página web (ou mobile) em que o teste precisa interagir diretamente.

```
*** Variables ***
${LOGIN_INPUT_USERNAME}            id=username 
${LOGIN_INPUT_PASSWORD}            xpath=//input[@id='password']
${LOGIN_BTN_LOGIN}                 xpath=//button[contains(@type,'submit')]
${LOGIN_DIV_LOGIN_SECURE_AREA}     xpath=//div[contains(text(), 'You logged into a secure area')]
${LOGIN_DIV_USERNAME_INVALID}      xpath=//div[contains(text(), ' Your username is invalid!')]
${LOGIN_DIV_PASSWORD_INVALID}      xpath=//div[contains(text(), ' Your password is invalid!')]

```
>Os arquivos NÃO devem ser alterados livremente, pois caso haja alguma alteração, é necessário refatoramento do código nas áreas afetadas pela mudança.

>Em caso de alteração, contatar o desenvolvedor responsável para ajustes.
		
###	1.3. Resources
A pasta resources contém arquivos de recursos gerais para o projeto. A pasta possui arquivos de comportamento do teste (como o Config.robot), onde são definidos os tempos de teardown, por exemplo, além de variáveis de ambiente (URL's).
		
> Os arquivos aqui podem ser editados baseados nas alterações que ocorrem no próprio sistema, como alterações de url, por exemplo, mas lembre-se que a alteração deve ser válida para que o funcionamento do teste automatizado não seja afetado. 

>Em caso de dúvidas, solicitar apoio para o desenvolvedor responsável.
		
###	1.4. Steps
Dentro da pasta steps existem arquivos .robot com nomes de fluxos implementados, este arquivo possui as funções referentes ao que o BDD solicita (Para entender mais sobre, releia o tópico 1.1. Features), é nela que o comportamento do teste é implementado e é aqui onde é feita toda a interação do framework (robot framework) com a aplicação. 
```
the user insert his credentials
    [Documentation]    A user must insert only one of the four next options for the operation type [valid, invalid, invalid username, invalid password]. The user doesn't need to put any inputs of usernames or password, this options is completely optional.  
    [Arguments]    ${type}=valid    ${username}=${login.valid_user}    ${password}=${login.valid_password}
    Set Global Variable    ${type}
    IF    '${type}' == 'valid'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${username}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${password}
    ELSE IF  '${type}' == 'invalid'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${login.invalid_user}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${login.invalid_password}
    ELSE IF  '${type}' == 'invalid username'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${login.invalid_user}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${password}
    ELSE IF  '${type}' == 'invalid password'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${username}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${login.invalid_password}
    END
```
		
>Os arquivos NÃO devem ser alterados livremente, pois caso haja alguma alteração, é necessário refatoramento do código nas áreas afetadas pela mudança.

>Em caso de alteração, contatar o desenvolvedor responsável para ajustes. 

## 2. Execução dos testes automatizados. 

### 2.1. Pré-requisitos	
#### 2.1.1. Linguagem
Para que os testes automatizados sejam funcionais, é necessário que sejam instalados: 
			
* [Python](https://www.python.org/) - versão mais recente.
    * Geralmente, junto do Python, vem instalado a função **pip** (verifique e garanta que a função esteja funcional).

#### 2.1.2. IDE
Instale uma IDE de sua preferência - Recomendada Visual Studio Code
		
#### 2.1.3. Variáveis de ambiente:
Também é necessário configurar as variáveis de ambiente (geralmente é feito automaticamente, mas verifique e garanta que tudo esteja nos conformes)

Para verificar se as variáveis de ambiente estão configuradas, você precisa (no windows):
```
- Acesse o menu iniciar
- Pesquise por 'variáveis de ambiente'
- Selecione a opção 'editar as variáveis de ambiente do sistema'
- Selecione a opção 'variáveis de ambiente...'
- No bloco 'Variáveis de usuário para [usuário]', localize a opção PATH
- Dê um duplo clique sobre a opção
- Verifique se está listado o caminho da instalação do Python
	- Caso sim, feche as janelas de variáveis de ambiente e prossiga com o uso normalmente. 
	- Caso não, clique no botão 'novo'
		- Insira o caminho de instalação do python
		- Selecione a opção 'ok'
		- Selecione a opção 'ok' 
		- Reinicie o sistema. 
- No bloco 'Variáveis do sistema', localize a opção PATH
- Dê um duplo clique sobre a opção
- Verifique se está listado o caminho da instalação do Python
	- Caso sim, feche as janelas de variáveis de ambiente e prossiga com o uso normalmente. 
- Caso não, clique no botão 'novo'
	- Insira o caminho de instalação do python
	- Selecione a opção 'ok'
	- Selecione a opção 'ok'
	- Reinicie o sistema. 
```

#### 2.1.4. Robotframework
Com o pip instalado na sua máquina, faça os seguintes passos:

##### Pelo visual studio code:

```
- Navegue até a opção 'ver'
- Selecione a opção 'terminal'
- Digite 'pip install robotframework' (sem aspas)
- Pressione enter
- Aguarde a instalação
``` 
##### Pelo cmd:
```
- Abra o menu iniciar do windows
- Digite cmd
- Clique com o botão direito sobre o ícode do prompt de comando
- Execute como administrador
- Digite 'pip install robotframework' (sem aspas)
- Pressione enter
- Aguarde a instalação
``` 

#### 2.1.5. SeleniumLibrary
Os testes automatizados foram implementados com as tecnologias Selenium e Robotframework, sendo necessária a instalação das bibliotecas que compõem o selenium, para isso, execute o seguinte comando:

##### Pelo visual studio code:
``` 
- Navegue até a opção 'ver'
- Selecione a opção 'terminal'
- Digite 'pip install robotframework-seleniumlibrary' (sem aspas)
- Pressione enter
- Aguarde a instalação
```
#### Pelo cmd:
```
- Abra o menu iniciar do windows
- Digite cmd
- Clique com o botão direito sobre o ícode do prompt de comando
- Execute como administrador
- Digite 'pip install robotframework-seleniumlibrary'' (sem aspas)
- Pressione enter
- Aguarde a instalação
```

### 2.2. Executando os testes automatizados
Para executar os testes automatizados, primeiro precisamos saber o que é a suíte de testes. 

#### 2.2.1. Suíte de testes
Basicamente é onde o arquivo responsável pelo comportamento do código está. Em outras palavras (dentro da nossa estrtutura) a suíte de testes é qualquer um dos arquivos .robot presentes na pasta 'features ¬ funcionalidade'.
```			
Exemplo:
	Pasta Raiz¬
		Features¬
			Login.robot
```
No exemplo acima, a suíte de testes de Login é o arquivo login.robot. 

Explicando tecnicamente, a suíte de testes é onde estão armazenados os comportamentos de uma funcionalidade, dentro de features > login.robot estão todos os comportamentos que foram solicitados a implementação, por exemplo:
```
CT-001: [Login] - Successfully login 
CT-002: [Login] - Failed login 
CT-003: [Login] - Failed login by invalid username
CT-004: [Login] - Failed login by invalid password
```
#### 2.2.2. Comandos para execução dos testes

Utilizaremos uma estrutura de dados básica que será usada em todos os exemplos. 

Dada a estrutura:
```
Pasta Raiz¬
	Features¬
		Login.robot
```
Sabendo que no arquivo Login.robot temos:
```
CT-001: [Login] - Successfully login 
	- Possui [TAGS] ct-001
CT-002: [Login] - Failed login 
	- Possui [TAGS] ct-002
CT-003: [Login] - Failed login by invalid username
	- Possui [TAGS] ct-001
``` 

Para executar os testes automatizados é necessário que o usuário abra o terminal na pasta onde a suíte de testes está localizada. 

Por exemplo: 

>  c:\\users\seu_user\desktop\pasta_raiz\testes\features\login

##### Através do visual studio code:
```
- Com o visual studio code aberto, abra a pasta onde o projeto se encontra
- Navegue até a opção 'arquivo'
- Selecione a opção 'abrir pasta'
- Selecione a pasta do projeto
- Clique com o botão direito sobre a suite de testes e selecione a opção 'abrir no terminal integrado'
- Espere o terminal integrado carregar e insira os comandos
```

##### Utilizando o cmd:
```
- Com o prompt de comando aberto, navegue até a pasta onde o projeto foi instalado
- Você pode utilizar a função 'cd' para avançar pasta a pasta ou apenas  digitar cd + (caminho completo onde o projeto está localizado)
- Uma vez dentro da pasta da suíte de testes basta executar os comandos
```

#### 2.2.2.1. Execução da suíte de teste completa
Para executar a suíte de testes completa, com o terminal integrado ou prompt de comando, abra a pasta onde a suíte de testes está localizada e execute o seguinte comando:

``` robot .\<suite de testes> ```

Lembre-se sempre de verificar se o seu terminal ou prompt de comando está indicando a pasta onde a suíte de testes está localizada.

No visual studio code ou no terminal a visualização deve ser algo como:
``` C:\\users\seu_user\desktop\pasta_raiz\features> robot .\login.robot ```

> Resultado esperado: O comando executará todos os testes automatizados que foram implementados na suíte 'login.robot'. Nesse caso os CTS 001, 002 e 003 são executado um após o outro até que o CT-003 seja finalizado.
				
#### 2.2.2.2. Execução de teste específica
Para executar um teste específico dentro de uma suíte de testes, utilizaremos sua TAG. Com o terminal integrado ou prompt de comando, abra a pasta onde a suíte de testes está localizada e execute o seguinte comando:

``` robot -i [TAG do cenário de testes] .\<suite de testes> ```

Lembre-se sempre de verificar se o seu terminal ou prompt de comando está indicando a pasta onde a suíte de testes está localizada.

No visual studio code ou no terminal a visualização deve ser algo como:
``` C:\\users\seu_user\desktop\pasta_raiz\features> robot -i ct-001 .\login.robot ```
						
> Resultado esperado: O comando executará todos os testes que possuírem a tag ct-001. Nesse caso, os 001 e 003 serão executados visto que seus identificadores são CT-001.
>> PS: Caso mais de um teste possua a mesma tag, ao executar o comando, todos os testes que tiverem essa tag serão executados. 

#### 2.2.2.3. Execução de mais de um teste específico
Para executar mais de um teste específico dentro de uma suíte de testes, também utilizaremos sua TAG. Com o terminal integrado ou prompt de comando, abra a pasta onde a suíte de testes está localizada e execute o seguinte comando:
		
``` robot -i [TAG do cenário de testes] -i [TAG do cenário de testes] .\<suite de testes> ```

Lembre-se sempre de verificar se o seu terminal ou prompt de comando está indicando a pasta onde a suíte de testes está localizada.

No visual studio code ou no terminal a visualização deve ser algo como:
``` C:\\users\seu_user\desktop\pasta_raiz\features> robot -i ct-001 -i ct-002 .\login.robot ```
						
>Resultado esperado: O comando executará todos os testes que possuírem a tag ct-001 e ct-002. Nesse caso todos os cts serão executados.