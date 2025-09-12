# ArrumaJÁ
Destinado a criação de uma loja virtual para serviços.
## Documentação dos códigos do projeto 
## HTML
É uma linguagem de marcação que permite ao navegador web entender sobre a estrututa do nosso site. (menu, tabelas, imagens, etc...)

### Tags HTML

- Doctype html : informa que o arquivo é do tipo html.
- html : informa o final dos códigos html.
- /html : informa o final dos códigos html.

- head  :utilizado para a configuração da página.

- meta  :é ultilizado para configurções de idioma responsividade e segurança.

- Title :é ultilizada para definis o nome que aparece na ava do navegador.

- Link  :é ultilizada para conectar nossa páginas com outros arquivos/urls externas.

- href  :é o local onde colocaremos endereço de arquivos, sites, ícones, imagens, etc.

- /head :sinaliza o fim da área de configuração da página.

- body : informa o inicio do corpo do site, é área que ficaram os códigos de tudo que é mostrado no site.

- div  : destinada a dividir/indicar partes da tela. Com ela a gente cria os espaços utilizados pelos elementos.

- section : é também utilizada para criar seções/espaços na nossa tela.

- h1, h2, h3, h5, h5, h6 : são ultilizadas para criar titulos.

- form : indica que será adicionado um formulário na nossa páginal.

- label : que é o texto dos formulários que serve (so para leitura), com por exemplo o nome dos campos.

- input : são caixas de digitação, que permitem capturar dados que as pessoas escrevem no formulário.

- button : indica um botão. Ele pode ser de 2 tipos Submit ( utilizado para enviar dados) ou botton (faz ações normais).

- a : é ultilizada para criar elementos clicáveis/links.

- img : utilizada para inserir imagens e ícones na pagina.

- video : utilizada para inserir vidios dentro da nossa página.

- p : ultilizado para cria paragráfos.

- class : permite criar classes para as tags. E as  classes utilizada para configurar o CSS daquele elemento.

- lang: define a linguagem.

- header : é utilizado para criar cabeçalhos.

- footer: é ultilizado para criar rodapé.

- script : indica códigos do JavaScript/back-end.

- alt : serve para adicionar textos alternativos, que aparecem caso a imagem ou video não seja disponível.

- placeholder : é aquele texto que desaparece ao digitar dentro do input.

- nav : é ultilizada para criar barras/menus de navegação.

- main : é utilizada para informa os códigos princinpais do sites.

- i : destinada a inserção de ícones.

- li, lu : é utilizado para criar listas.

- table : criação de tabelas

- option : utilizado para menus de opções.

- select : utilizado para criar elementos selecionáveis.

- src : e utilizado para informar o caminho de um arquivo.


## CSS 

é uma folha de estilização dos elementos da páginas, aqui são comfiguradas cores, tamanho, espaços, etc.

### Elementos de estilos

- .nome da classe  {} : esta parte é destinada a informar qual a classe que vai receber as configurações de estilo, que ficam dentro das chaves.

- background-color : utilizado para definir cor de fundo do elemento.

- padding : utilizado para definir o espaço interno de um elemento (geralmente usados em div , header, footer, buton, e outros elementos que possuem uma área).

- color: é utilizado para colocar cor no texto.

-  allign-items : e utilizado para alinhar os elementos que eestão dentro do elemento da classe.

-  center: centralizar

-  bottom : parte de baixo.

-  top : parte superior/em cima.

-  left: esquerda.
-  right: direita.

-  display : é utilizado para redimensionar o tamanho dos elementos (geralmene utilizados o flex nele).

-  justify-content: define a posição do elemento.(end - fim ,start - inicio , center - meio, space-between - coloca os elementos um ao lado do outro com espaços iguais os separando ).

-  font-size : é utilizado para configurar o tamanho do texto.

-  font-weight: configura estilo de fonte (bold - negrito , semibold - negrito mais fraco).

-  width : define a largura em px (pixels).
-  height : define altura em px(pixels).
-  max-width: largura máxima.
-  max-height: altura máxima.

-  margin :define as margens ao redor do elementos em todos os lados.
-  margin-top : define margens para o topo.
-  margin-bottom : define margens para o baixo.
-  margin-left : define margens para a esquerda.
-  margin-right : define margens para a direita.

-  border : define se o elemento vai ter borda.
-  border-radiuns : define o arredondamento da borda.
-  border-color : define a cor da borda.
-  border-width : define a largira da borda em px(pixels).

-  gap: define espaços entre elementos.
-  cursor: define as configurações do cursor do mause ao clicar/passar sobre o elemento. Se vai aparecer ponteiro, seta, etc.
-  font-family: define o tipo de fonte.
-  transition: define transsições/animações para os elementos.
-  hidden: esconde/oculta o elemento.
-  box-shadow: aplica sombras sobre o elemento.
-  text-aling: alinhamento do texto.
-  outline: define configurções de linha.
-  z-index: controla a ordem de sobreposição de elementos alinhados. Imforma se o elemento alinhados. Informa se  o elemento vai ficar fixo no lugar, se ele é o primeiro, se eke fica atrás, etc.



## Bootstrap
é um framework que já vem com varias classes estilizadas de css, prontas para uso. Então ap invés de ficar configurando o arquivo css, você so precisa chamar o nome das classes do bootstrap dentro do html que ele já configura os elementos.

### classes do bootstrap
- container : deixa a div se expandir junto com a tela.
- container-fluid: deixa a divse expandir junto com a tela.
- row: faz com que os elementos dentro da div fiquem na mesma linha.
- col-1  até 12: define quais colunas o elemento ocupa.
- w-100: define que o elemento ocupa 100% da altura.
- bg-white: define cor de fundo branca.
- mb-1 ate 5: define margem para baixo.
- mt-1 ate 5: define margem para o topo.
