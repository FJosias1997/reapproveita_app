![Status do Projeto](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow)
![Hackathon](https://img.shields.io/badge/Contexto-Hackathon%20de%20Sa%20%26%20Nutri-blue)

![Flutter](https://img.shields.io/badge/Frontend-Flutter-blue.svg?logo=flutter)
![Dart](https://img.shields.io/badge/Linguagem-Dart-0175C2.svg?logo=dart)

![FastAPI](https://img.shields.io/badge/Backend-FastAPI-green.svg?logo=python)
![Python](https://img.shields.io/badge/Linguagem-Python-3776AB.svg?logo=python)

# Reapproveita 🥦

O Reapproveita é um aplicativo mobile focado em combater o desperdício de alimentos e promover a segurança alimentar. A plataforma conecta supermercados parceiros a consumidores, ofertando produtos próximos da data de validade com um desconto de 50%.

Este projeto ataca diretamente o problema do desperdício, uma pauta de extrema relevância, especialmente em contextos de sustentabilidade e nutrição.

 ## Contexto do Projeto

Este aplicativo foi idealizado e desenvolvido como uma solução para um Hackathon de Saúde e Nutrição. O objetivo era criar uma ferramenta tecnológica viável que pudesse causar um impacto positivo e direto na saúde da população e na cadeia de suprimentos de alimentos.

⚠️ Aviso: Este é um projeto de protótipo e continua em desenvolvimento. Algumas telas e funcionalidades podem não estar 100% funcionais e servem como prova de conceito.

## Funcionalidades Implementadas (Demo)

O fluxo principal do usuário já está implementado, conforme demonstrado no vídeo:

    Home (Tela Inicial):

        Listagem de produtos em GridView.

        Carrossel horizontal de "Ofertas Imperdíveis".

        Listagem de "Supermercados" parceiros.

    Detalhes do Produto:

        Visualização de imagem, preço, supermercado (com logo e avaliação) e descrição.

        Botão para adicionar o produto ao carrinho.

    Pesquisa:

        Tela de pesquisa com sugestões de busca em tempo real.

        Exibição dos resultados da pesquisa.

    Carrinho:

        Listagem dos produtos adicionados.

        Cálculo do valor total.

        Funcionalidade de remover item (usando Dismissible, ao deslizar para o lado).

    Checkout e Pagamento:

        Tela de pagamento com QR Code Pix.

        Simulação de barra de progresso de pagamento.

        Exibição de diálogo de "Sucesso" após a conclusão.

    Navegação:

        Uso de BottomNavigationBar para navegar entre Home, Endereços, Perfil.

        Tela de Perfil de usuário (layout).

## Algumas Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/3a143999-e2f7-4d86-b68f-30db9c141234" width="230" />
  <img src="https://github.com/user-attachments/assets/52811b12-0d3b-4aad-b71c-bd4cc5392af7" width="230" />
  <img src="https://github.com/user-attachments/assets/bd6663b9-ffa5-4e19-9cb6-93859952de4b" width="230" />
  <img src="https://github.com/user-attachments/assets/0c6b1077-6db9-4fc4-b5a3-f302379d0311" width="230" />
  <img src="https://github.com/user-attachments/assets/601344be-b122-4ce1-9cae-150f3f7c987c" width="230" />
</p>

## Demo


https://github.com/user-attachments/assets/3aed45f4-42e0-4005-96e0-f29c9ad8d28e
https://github.com/user-attachments/assets/276e6059-7cde-4c8b-a214-f012cb5df928




## Tecnologias Utilizadas

O projeto foi construído com uma stack moderna, separando claramente o frontend do backend:

Frontend (Mobile App)

    Flutter: Toolkit de UI do Google para criar aplicativos nativos multiplataforma.

    Gerenciamento de Estado: BLoC (Business Logic Component)

    Widgets Notáveis:

        GridView

        CarouselSlider

        Dismissible

        BottomNavigationBar

Backend (API)

    Python 3: Linguagem de programação principal.

    FastAPI: Framework web moderno e de alta performance para construir APIs com Python.

## Estrutura do Projeto (App Flutter)

O código-fonte do aplicativo Flutter está organizado de forma limpa, seguindo as melhores práticas de separação de responsabilidades:

```
lib/
├── data/
│   ├── bloc/         # Lógica de negócios e gerenciamento de estado
│   ├── models/       # Modelos de dados (Produto, Supermercado, etc.)
│   └── providers/    # Conexão com a API (Repository Pattern)
│
├── global_widgets/   # Widgets reutilizáveis (Botões, Cards, AppBar, etc.)
│
├── pages/            # Telas principais da aplicação
│   ├── checkout/
│   │   └── checkout_page.dart
│   ├── home/
│   │   └── home_page.dart
│   ├── payment/
│   ├── product_details/
│   ├── profile/
│   └── search_results/
│
├── theme/            # Definições de tema (cores, fontes)
├── utils/            # Funções utilitárias
└── main.dart         # Ponto de entrada da aplicação
```

## Como Executar (Em breve)

Instruções detalhadas de como configurar e executar o backend FastAPI e o app Flutter serão adicionadas em breve.

Pré-requisitos

    Flutter SDK (v3.x.x)

    Python (v3.10+)

    MySQL (Console e Workbench)

