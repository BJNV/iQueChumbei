# iQueChumbei

## Aplicação Híbrida-Nativa que permite aos utilizadores (alunos de uma escola ou universidade) registar as avaliações de cada disciplina, funcionado assim como uma agenda

Este projeto foi desenvolvido para a cadeira de Computação Móvel (2022/2023). A solução desenvolvida resume-se a uma aplicação Híbrida-Nativa desenvolvida em Flutter pois desta forma poderá servir tanto os alunos que utilizam Android como os que usam iOS.
A aplicação apresenta alguns registos pré-carregados que servem como uma pequena demonstração das funcionalidades pedidas. 

A navegação da aplicação consiste realiza-se através de uma BottomNavigationBar com acesso aos 3 principais ecrãs:
* Dashboard
* Listagem de Avaliações
* Registo de Avaliação

## Dashboard
O Dashboard é o primeiro ecrã a ser apresentado assim que se entra na aplicação. Neste ecrã o utilizador pode verirficar as seguintes informações:
* Nível médio de dificuldade das avaliações nos próximos 7 dias
* Nível médio de dificuldade das avaliações entre os 7 e os 14 dias (futuro)
* Lista com as avaliações dos próximos 7 dias (ordenadas de Oldest to Newest)

Na lista será possível observarmos 3 tipos de cores:
* Vermelho - Indica que a avaliação é no próprio dia
* Laranja - Indica que a avaliação é no dia seguinte (No caso de ser sexta-feira/sábado e a avaliação for na segunda-feira o mesmo é incluido como "avaliação no dia seguinte")
* Branco - Indica que a avaliação não é em nenhum dos casos anteriores, mas que acontecerá nos próximos 7 dias

É possível clicar num registo e aceder a toda a sua informação levando o utilizador para o ecrã "Consulta de Registo".

## Registo de Avaliação
Os registos de avaliação são realizados através de um formulário que solicita ao utilizador os seguintes dados:
* Nome da Disciplina - (Não é possível deixar em branco)
* Tipo de Avaliação - Dropdown com os tipos de avaliações possíveis, selecionar uma
* Data e Hora - (Obrigatório selecionar uma data / Não é possivel marcar para um dia anterior ao atual)
* Nível de Dificuldade - Escala de 1 a 5 (Não é possível deixar em branco)
* Observações - Máximo 200 caracteres (incluindo espaços)
ATENÇÃO - Todos os campos são obrigatórios excepto as Observações

Após a submissão do formulário o registo ficará visivel no ecrã "Listagem de Avaliações" (e, se for o caso, apresentado no ecrã Dashboard).

## Listagem de Avaliações
Neste ecrã o utilizador pode consultar, editar ou eliminar registos.
Para consultar os registos basta clicar num e conseguimos aceder a toda a sua informação, tal como no Dashboard.
Para editarmos/eliminarmos é preciso fazer um swipe da Direita para a Esquerda.
ATENÇÃO: Só podem ser editados/eliminados registos do futuro, todos os outros a aplicação irá apresentar uma mensagem de erro.

Tal como no Dashboard as avaliações estão ordenadas de Oldest to Newest, e a teoria de cores usada é a mesma mas com uma pequena adição:
* Verde - Indica que a avaliação já foi feita

## Consulta de Registo & Dealer
Neste ecrã o utilizador pode consultar toda a informação associada a um registo de uma avaliação, tendo em consideração o formulário de registo.
Este ecrã apenas serve para consulta, mas possui um botão "Share" que tem como objetivo partilhar automaticamente todo o registo de uma avaliação para uma aplicação de troca de mensagens, e-mail, entre outras.

## Edição de Registo
Neste ecrã o utilizador pode editar a informação de um registo de avaliação futura.
Toda a informação relativamente ao registo é colocada no formulário automaticamente, e no caso de ser necessário alterar algo é só mudar.
ATENÇÃO: Não é possível alterar a data para uma data anterior a atual

Após a edtição do registo o utilizador volta para o ecrã "Listagem de Avaliações".

## Eliminação de Registo
O utilizador após realizar o swipe e escolher a opção de eliminar o registo, será apresentada uma mensagem de aviso se pretende eliminar permanentemente o registo. Se selecionar "Eliminar" o registo será eliminado da lista, se selecionar "Cancelar" o utilizador volta para o ecrã "Listagem de Avaliações".


### Autoavaliação 
15 Valores

Bernardo Vinagre - a22007130
