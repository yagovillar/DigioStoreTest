# Digio Store

Este projeto é um aplicativo iOS desenvolvido para listar produtos da Digio Store e exibir detalhes de cada produto. O aplicativo utiliza as tecnologias e práticas recomendadas para criar uma experiência de usuário fluida e eficiente.

## Arquitetura

O projeto segue a arquitetura **MVVM-C** (Model-View-ViewModel-Coordinator), que separa as responsabilidades e melhora a manutenibilidade e testabilidade do código:

- **Model:** Representa os dados e a lógica de negócios.
- **View:** Gerencia a interface do usuário e interage com o ViewModel.
- **ViewModel:** Prepara e formata os dados para a View.
- **Coordinator:** Gerencia a navegação entre as telas.

## Tecnologias e Ferramentas

- **Swift 4.2:** Linguagem de programação utilizada.
- **iOS Deployment Target 12:** Versão mínima do iOS suportada.
- **URLSession + Codable:** Utilizado para requisições de rede e parsing de dados JSON.
- **SwiftLint:** Ferramenta para garantir a conformidade com as regras de estilo de código Swift.
- **Fastlane:** Automatiza o processo de build e deploy do aplicativo.

## Bibliotecas e Dependências

O projeto utiliza o **Cocoapods** para gerenciamento de dependências. No entanto, optamos por não usar bibliotecas de terceiros como Alamofire e Kingfisher, para garantir maior controle sobre o código e reduzir dependências externas.

## Como Executar o Projeto

1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/digio-store.git
    ```

2. Navegue até o diretório do projeto.
   

3. Instale as dependências com Cocoapods:
    ```bash
    pod install
    ```

4. Abra o projeto no Xcode usando o arquivo `.xcworkspace`:
    ```bash
    open DigioStore.xcworkspace
    ```

5. Compile e execute o aplicativo no Xcode.

## Decisões de Projeto

- **Gerenciamento de Estado:** Utilizamos o padrão MVVM para separar a lógica de apresentação da lógica de negócios.
- **Requisições de Rede:** Optamos por usar URLSession e Codable para interagir com a API e processar dados JSON.
- **Tratamento de Erros:** Implementamos tratamento robusto de erros para garantir uma boa experiência de usuário e facilitar a depuração.

## Testes

O projeto inclui testes unitários para validar a lógica de negócios e garantir a integridade do código.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---
