# mesa_news_challenge

É um app que mostra as principais notícias do mundo, podendedo acessar o app por uma conta existente, criando uma conta ou login por facebook. 

É possível visualziar duas sessões de noticias: as emd estaque e as ultimas notícias. As notícias são organizadas pelas respectiva ordem:favoritos, data de publicação e nome.

Cada notícia possui uma imagem, um titulo, subtitulo, conteúdo, podendo ser favoritada e desfavoritada. 

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### .env 
Criado um arquivo .env para adicionar a base URL para requisições api.
`API_BASE_URL`=mesa-news-api.herokuapp.com
## Style Guides
A criação do Style Guides tem como objetivo padronizar e reutilizar determinados parâmetros de estilização. Neste projeto foi criado a classe **`MesaTextGuide`** para definição de estilos de textos e **`MesaColorGuide`** para definição de cores mapeadas previamente de acordo com o design.

É importante lembrar que a criação do Styles guides para cor e texto não ausenta ou diminui a necessita de uma boa configuração do tema do projeto, na qual é de suma importância para otimizar o processo de desenvolvimento e estilização de determinados widgets.
## Arquitetura e módulos
Foi utilizado como padrão de projeto a arquitetura clean, respeitando os princípios das camadas domain, data e services, de forma a facilitar criação de testes unitários e independência da interface e serviços.

Também, é possível observar conceitos do padrão de projeto modular, na qual possibilita injeção de dependência e nomeação do rotas. 

### Splash
O módulo de **splash**, encontrado pela rota *"/"*. Pela baixa complexidade de lógica só foi implementada apenas a camada de presenter.

### Onboarding
O módulo de onboarding ,rota *"/onboarding"*, é responsável pela exibição da tela inicial do aplicativo. Pela baixa complexidade de lógica só foi implementada apenas a camada de presenter. 

### Signin
O módulo de **signin**, rota *"onboarding/signin"*, responsável pela autenticação e redirecionamento para a homePage caso esteja tudo correto com os dados do usuário. 

 **Casos de uso**:
- login com facebook.
- login pelo serviço de api


### Signup
O módulo de **signup**, rota *"/onboarding/signup"*, responsável pelo cadastro do usuário.

 **Casos de uso**:
- cadastro de usuário pelo serviço de api.

### home
O módulo de **home**, rota *"/home"*, responśavel pela exibição das notícias. É possível encontrar as subrotas para filtragem de noticias *"/filter"* e leitura de notícia *"/news*
 
 **Casos de uso**:
- Busca das notícias em destaque.
- Busca das últimas notícias

## services
Criado para definir a configurações iniciais das requisições API,( baseURL, headers, Authorization), e também para definir as funções de requisições api de maneira agrupadas e organizadas com objetivo de facilitar a manutenção, legibilidade e padronização.

Foram criadas as chamadas:
- **Future<Response> signinUser(SigninModel user) async**: Envia-se um usuário e retorna-se um token válido.
- **Future<Response> signupUser(SignupModel user) async**:Envia os parâmetros de cadastro do usuário e retorn um token de usuário válido.
- **Future<Response> loginSocialMedia(SigninModel user, {User userAuth}) async:** Cadastra ou autentica o usuário através da rede social
- **Future<Response> fetchNews({int currentPage,int perPage,DateTime published,}) async:** Retorna as ultimas notícias.
_**Future<Response> fetchNewsHighlights() async**: Retorna as noticia em destaque


## utils
O diretório Utils foi criado para reutilizações de funções que podem ser utilizadas em toda a aplicação, evitando assim repetições de código de forma desnecessária. É possível utilizar as funções através da classe **MesaUtils**.

- **MaskTextInputFormatter phoneFormatter**: Retorna uma máscara de número no padrão brasileiro.
- **static bool isValidEmail(String email)**: Retorna se o email digitado é válido.
- **static void showLongToast(String msg)**: Retorna um toast com configurações pré-definidas.
- **static String dateFormatWithUpdate(DateTime date)**: Formata uma data informando a sua atualização.
- **static String dateTimeDifference(DateTime date)** Retorna a diferença entre uma data e o dia atual em string
## enum
Padronização de valores esperado.
**`enum MesaButtonType {PRIMARY, LOADING,  DISABLED,}`**

**`enum MesaNewsType { NEWS, NEWSHIGHLIGHT }`**
## testes unitários
Inicialmente foram realizados os teste unitários dos respectivos módulos: home, signin, signup, aplicando os testes nas camadas de domain e data, afim de prever possíveis casos de erro e corrigi-los previamente.


## widgets
Por padrão todos os widgets iniciam-se com o prefixo *Mesa* e terminam com o sufixo *Widget* para facilitar a busca e diferenciação de Widgets do material.

### MesaAnimationSizeWidget
Widget criado para realizar a animação do tamanho de um child. é recebe como parâmetro.

` class MesaAnimationSizeWidget ...{
    final Widget child; -> filho que será animado
  final double width, height; -> propriedade que será redimensionada
  final Duration duration; -> duração da animação
}`

### MesaAppBarDefaultWidget

Appbar padrão reutilziada em todas as páginas do app. 

`class MesaAppBarDefaultWidget ... {
 final String title, subtitle; -> Propriedade que compõe a descrição central do texto. Ambas podem ser opcionais.
  final TextStyle textStyle; -> Estilização da propriedade do texto Title
  final Widget prefix, sufix; -> Widget que deverá encontrar-se respectivamente a esquerda ou a direita dos textos.
}`

### MesaButtonDefaultWidget
Widget responsável por retornar um botão de acordo com os estilos de botões encontrados no design.  O seu estilo varia entre o primário, loading e desabilitado, entretanto, nada impede novas customizações.

`class MesaButtonDefaultWidget... {
    final String text; -> texto principal do botão.
  final TextStyle textStyle; Estilização do texto principal do botão
  final Color backgroundColor; -> Definição da cor de background do botão, por padrão atende a cor primária do style guides
  final BorderSide border; -> Definição da borda do botão
  final Function onPressed; -> função para callback de função
  final MesaButtonType type; -> Qual o tipo de botão deverá ser exibido. Loading | primary | desabled
}`

### MesaSwitchButtonWidget

Widget que atende ao comportamente de switch atendendo as exigencias da interface, visto a limitação do Switch do material design.

`class MesaSwitchButtonWidget ...{
    final Function(bool) onChanged; -> Função que retorna o novo valor do switch;
  final bool value; -> valor incial do switch
}`

### MesaIconButtonWidget
Widget para agrupar um ícone a uma resposta de toque.

`class MesaIconButtonWidget ... {
      final Function() onTap; -> função de callback ao clique no ícone
  final String iconPath; -> url do icone local
  final Color iconColor; -> cor do icone
}`

### MesaCardLastNewsWidget
Widget para exibição das últimas notícias na página de home.

` class MesaCardLastNewsWidget... {
      final String imagePath, title, description, dateTime, content; Definição das propriedades textuais (título, descrição, data formatada e conteúdo completo quando necessário exibir)
  final Function() onTap; Callback de resposta ao clique no card como inteiro
  final Function() onChanged; callbalck de resposta ao clique no icone de favoritar e desfavoritar o card
  final bool isbookmark; Estado de favorito podendo ser verdadeiro ou false
}`

### MesaCardTrendWidget
Widget para exibição das notícias em destaque na página de home.

`class MesaCardTrendWidget ... {
   final String imagePath, dateTime, title; -> Definição das propriedades textuais (título, descrição, data formatada)
  final Function() onChanged, onTap; -> Callbacks para resposta ao clique no card ou no marcador de favorito
  final bool isbookmark;-> Estado de favorito podendo ser verdadeiro ou false
}`

### MesaFooterDefaultWidget
Widget criado para reutilização de código para criação do footer do app.

`class MesaFooterDefaultWidget... {
    final String text, textLink; -Texto que será exibido e texto que conterá o link para o redirecionamento
    final TextStyle textStyle, textLinkStyle; -> Propriedade para estilização dos respectivos textos
    final Function() onTap -> Callback de resposta ao clique no texto com link;
}`

### MesaTextFieldDefaultWidget
Widget criado apra reutilziação do textfield padrão no app respeitando as especificações do design.

`class MesaTextFieldDefaultWidget... {
final String label; -> Label de descrição do textfield
  final TextInputType keyboardType; -> O tipo de textfield será
  final bool autofocus, obscureText; -> Se o valor digitado deverá ser ocultado ou não
  final Function(String) onChanged -> callback com retorno do que é digitado pelo usuário;
  final List<TextInputFormatter> maskFormatter -> Definição da mascara para formatação do valor digitado;
  final String errorText -> exibição do texto de erro no textfield;
}`
