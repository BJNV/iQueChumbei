# iQueChumbei


## Aplicação Híbrida-Nativa que permite ao utilizador registar as avaliações de cada disciplina, funcionado assim como uma agenda

Este projeto foi desenvolvido para a cadeira de Computação Móvel (2022/2023). A solução desenvolvida resume-se a uma aplicação Híbrida-Nativa desenvolvida em Flutter pois desta forma poderá servir tanto os alunos que utilizam Android como os que usam iOS.
A aplicação apresenta alguns registos pré-carregados que servem como uma pequena demonstração das funcionalidades pedidas. 

A navegação da aplicação consiste realiza-se através de uma BottomNavigationBar com acesso aos 3 principais ecrãs:
* Dashboard
* Listagem de Avaliações
* Registo de Avaliação

<br>

## Dashboard
É o primeiro ecrã a ser apresentado assim que se entra na aplicação. Neste ecrã o utilizador pode verirficar as seguintes informações:
* Nível médio de dificuldade das avaliações nos próximos 7 dias
* Nível médio de dificuldade das avaliações entre os 7 e os 14 dias (futuro)
* Lista com as avaliações dos próximos 7 dias (ordenadas de Oldest to Newest)

Na lista será possível observarmos 3 tipos de cores:
* Vermelho - Indica que a avaliação é no próprio dia
* Laranja - Indica que a avaliação é no dia seguinte (No caso de ser sexta-feira/sábado e a avaliação for na segunda-feira o mesmo é incluido como "avaliação no dia seguinte")
* Branco - Indica que a avaliação não é em nenhum dos casos anteriores, mas que acontecerá nos próximos 7 dias

É possível clicar num registo e aceder a toda a sua informação levando o utilizador para o ecrã "Consulta de Registo".

<br>

<p align="center">
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224813002-e6b04ff5-d0b1-4f0b-bb2c-0a2a677e04ad.png">
</p>

<br>

## Listagem de Avaliações
Aqui o utilizador pode consultar, editar ou eliminar registos.
Para consultar os registos basta clicar num e conseguimos aceder a toda a sua informação, tal como no Dashboard.
Para editarmos/eliminarmos é preciso fazer um swipe da Direita para a Esquerda.

<br>

ATENÇÃO: Só podem ser editados/eliminados registos do futuro, todos os outros a aplicação irá apresentar uma mensagem de erro.

<br>

Tal como no Dashboard as avaliações estão ordenadas de Oldest to Newest, e a teoria de cores usada é a mesma mas com uma pequena adição:
* Verde - Indica que a avaliação já foi feita

<br>

<p align="center">
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224815828-5941585a-594f-4848-9634-fee9d80b41d8.png">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224816306-1accd4c7-e397-475e-8529-e91687224140.png"> 
</p>

<br>

## Registo de Avaliação
Os registos de avaliação são realizados através de um formulário que solicita ao utilizador os seguintes dados:
* Nome da Disciplina - (Não é possível deixar em branco)
* Tipo de Avaliação - Dropdown com os tipos de avaliações possíveis, selecionar uma
* Data e Hora - (Obrigatório selecionar uma data / Não é possivel marcar para um dia anterior ao atual)
* Nível de Dificuldade - Escala de 1 a 5 (Não é possível deixar em branco)
* Observações - Máximo 200 caracteres (incluindo espaços)

<br>

ATENÇÃO - Todos os campos são obrigatórios excepto as Observações

<br>

Após a submissão do formulário o registo ficará visivel no ecrã "Listagem de Avaliações" (e, se for o caso, apresentado no ecrã Dashboard).

<br>

<p align="center">
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224817654-699f1fb6-a0c7-46b4-82f9-5af64d6de245.png">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224817764-71115eb7-ee4c-4a8e-a352-48a49512d669.png"> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224817716-7957a232-e88b-4362-8527-a2cccf04bdea.png"> 
</p>

<br>

## Consulta de Registo & Dealer
Na Consulta Detalhada do registo o utilizador pode consultar toda a informação associada a um registo de uma avaliação, tendo em consideração o formulário de registo.
Este ecrã apenas serve para consulta, mas possui um botão "Share" que tem como objetivo partilhar automaticamente todo o registo de uma avaliação para uma aplicação de troca de mensagens, e-mail, entre outras.

<br>

<p align="center">
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224818492-01426395-5a07-49b6-a607-28c9bc48479d.png">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224818549-ca808cb0-8b0f-4b0c-9765-85210f65b0d8.png"> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224818597-a5951d84-af73-4d12-aa30-b4ffa8feaa98.png"> 
</p>

<br>

## Edição de Registo
O utilizador realizar o swipe e escolher a opção de editar, poderá editar a informação de um registo de avaliação futura.
Toda a informação relativamente ao registo é colocada no formulário automaticamente, e no caso de ser necessário alterar algo é só editar.

<br>

ATENÇÃO: Não é possível alterar a data para uma data anterior a atual

<br>

Após a edtição do registo o utilizador volta para o ecrã "Listagem de Avaliações".

<br>

<p align="center">
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224820296-185b4173-6e29-4a4d-b6db-5a614aaeb5db.png">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224820340-ec9fbc4d-d0a0-4831-86bf-0f11123d8a99.png"> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224820353-c20a3677-4288-466a-a373-4ba4cd33dec1.png"> 
</p>

<br>

## Eliminação de Registo
O utilizador após realizar o swipe e escolher a opção de eliminar o registo, será apresentada uma mensagem de aviso se pretende eliminar permanentemente o registo. Se selecionar "Eliminar" o registo será eliminado da lista, se selecionar "Cancelar" o utilizador volta para o ecrã "Listagem de Avaliações".

<br>

<p align="center">
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224821552-9e8b18a6-70d1-4ddc-83a0-e3ad46436f5e.png">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224821561-6ae7e4ea-e6e3-45bf-a6da-836c8755a056.png"> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img width="25%" height="25%" src="https://user-images.githubusercontent.com/79208470/224821566-e31e8c00-16d9-4fe9-82a2-8f82d4cbcb88.png"> 
</p>

<br>

Bernardo Vinagre - a22007130
