# OINetwork

# Introdução: 

Modulo network para a arquitetura modular do projeto Liveness2D e Liveness3D   

## Conteudo do modulo

- Imagens, Fontes, Cores, Strings e Utils

## Ferramentas

- Xcode 13
- iOS 15
- Swift 5
- CocoaPods

## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto de exemplo pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`OINetwork.xcworkspace`**

## Instruçōes para gerar uma nova versão do modulo
- No arquivo Podfile alterar para OINetwork/Debug
- pod install no projeto de exemplo
- Buildar o projeto a partir do exemplo
- Na pasta products terá o xcframework, copie ele e cole na pasta Framework na raiz do projeto
- Criar uma PR para a branch main com o novo conteudo desenvolvido
- Após mergeado a PR criar uma nova Tag no git a partir da branch Main
- Vá no podspec na pasta OINetwork e crie uma pasta com o numero da sua tag criada
- Atualize o OINetwork.podspec do podspec para a versão respectiva

## Dependências
 - OICommons
 
 ## Colaboradores
 - Thiago Cavalcante de Oliveira
 - Vitor
