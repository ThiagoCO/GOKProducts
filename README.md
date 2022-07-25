# GOKProducts.

Desenvolvido por Thiago Cavalcante de Oliveira.

# Introdução: 
Aplicativo iOS que tem como objetivo acessar a API que simula a home do aplicativo do Digio 

## Screenshots

<img src="https://i.ibb.co/Y0nNmQZ/Captura-de-Tela-2022-07-25-a-s-12-14-42.png" height="400" width="200">     


## API
- Request home: https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products


## Ferramentas utilizadas

- Xcode 13
- iOS 15
- Swift 5
- CocoaPods
- 100% CodeView

## Testes

- Testes unitarios nas camadas do Interactor e Presenter (testes nativos)
- Teste de viewController com snapshot (FBSnapshotTestCase)
- Cobertura de teste de 83,2% do projeto

## Arquitetura utilizada

Neste projeto estou utilizando o Clean Swift.

Mais informações: https://clean-swift.com/clean-swift-ios-architecture/
 
## Pods utilizados

#### SDWebImage (https://github.com/rs/SDWebImage)
Para carregar imagens e gerenciar cache.

#### iOSSnapshotTestCase (https://github.com/uber/ios-snapshot-test-case)
Para teste de snapshot.


## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`GOKProducts.xcworkspace`**

OBS: Não abra pelo **`GOKProducts.xcodeproj`** pois os pods não serão carregados e dará erro na hora de compilar.

## Instruçōes para compilação dos testes
- Utilizar para o build do teste de snapshot utilizando o iPhone 11 Pro
