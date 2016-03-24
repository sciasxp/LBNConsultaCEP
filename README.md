# LBNConsultaCEP

[![CI Status](http://img.shields.io/travis/Luciano Bastos Nunes/LBNConsultaCEP.svg?style=flat)](https://travis-ci.org/Luciano Bastos Nunes/LBNConsultaCEP)
[![Version](https://img.shields.io/cocoapods/v/LBNConsultaCEP.svg?style=flat)](http://cocoapods.org/pods/LBNConsultaCEP)
[![License](https://img.shields.io/cocoapods/l/LBNConsultaCEP.svg?style=flat)](http://cocoapods.org/pods/LBNConsultaCEP)
[![Platform](https://img.shields.io/cocoapods/p/LBNConsultaCEP.svg?style=flat)](http://cocoapods.org/pods/LBNConsultaCEP)

## Uso

Para executar o projeto de exemplo, primeiro clone o repositório e execute `pod install` a partir do diretório Example.

## Requirements

iOS 7.1 ou posterior.

## Installation

LBNConsultaCEP está disponível através do [CocoaPods](http://cocoapods.org). Para instalar, basta adicionar a seguinte linha no PodFile em seu projeto:

```ruby
pod "LBNConsultaCEP"
```

## Documentação

### getAddressFromCEP
```Objective-c
+ (void)getAddressFromCEP:(NSString *)cep Response:(void(^)(id, NSError *))block
```
#### Resumo

Metôdo de classe com processamento assíncrono, que ao informar o cep, retornar através do bloco `block` o resultado da pesquisa.

#### Paramêtros
- **cep**: String contendo o CEP. Ele pode ser informado somente o número do CEP ou o CEP formatado. EX: `69000-000` ou `69000000`.
- **block**: É o *callback* que irá retornar o resultado da consulta. O bloco retorna dois paramêtros de tipos: `id` e `NSError`. O primeiro paramêtro retorna o conteúdo da pesquisa caso tenha sido bem sucedida e o segundo retorna um erro caso tenha havido um erro na pesquisa.

## Exemplo

```Objective-c
[LBNConsultaCEP getAddressFromCEP:self.cepTextField.text Response:^(id address, NSError *error) {

if (!error) {

NSString *rua = address[@"rua"];
NSString *bairro = address[@"bairro"];
NSString *cidadeEstado = address[@"cidadeEstado"];
NSString *cep = address[@"cep"];

} else {

NSLog(@"Erro: %@", error.localizedDescription);
}
}];
```

## OBS

O projeto faz uso da biblioteca [BRYHTMLParser](https://github.com/irace/BRYHTMLParser),  disponível pela licença MIT, para realizar o parse do HTML.

## Autor

Luciano Bastos Nunes, sciasxp@gmail.com

## Licença

LBNConsultaCEP está disponível sob a licença MIT. Veja o arquivo LICENSE para mais informações.
