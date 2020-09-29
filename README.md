# Quero Backend Development Challenge 

<!-- TOC depthFrom:1 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Quero Backend Development Challenge](#quero-backend-development-challenge)
    - [Intro](#intro)
    - [O Desafio](#desafio)
    - [API overview](#api-overview)
    - [Result types](#result-types)
    - [Resource components](#resource-components)
    - [Parameters](#parameters)
    - [Queries](#queries)
    - [Field Queries](#field-queries)
    - [Sorting](#sorting)
    - [Facet counts](#facet-counts)
    - [Filter names](#filter-names)
    - [Result controls](#result-controls)
    - [API versioning](#api-versioning)
    - [Documentation history](#documentation-history)

<!-- /TOC -->

# Intro

Este projeto é a solução do desafiotécnico de desenvolvimento backend proposto pela QueroEducação para o processo seletivo da vaga de Desenvolvedor(a) Full Stack. A solução foi desenvolvida inteiramente por Alexandre Castello (https://github.com/alexandrecastello / https://www.linkedin.com/in/alecastello/)

# O Desafio

```
 ![logo-quero-edu-small](https://user-images.githubusercontent.com/1139813/90247813-c9cfc780-de0d-11ea-9a97-485a7212d9dd.png)

## Objetivo

O Quero Bolsa é um marketplace de bolsas de estudo, que já ajudou milhares de alunos a escolher e ingressar no curso ideal, por um preço que podem pagar. A sua missão é criar uma API para exibição e filtragem de ofertas de curso.

## Requisitos do Projeto

- Apenas código backend será considerado.
- Para a sua solução, você poderá usar a linguagem e framework que esteja mais familiarizado, de preferência Ruby, Elixir ou NodeJs. 
- Você poderá usar bibliotecas de testes unitários ou ferramentas de build/migrations disponíveis para a linguagem que você escolher, mas não será aceita a utilização de bibliotecas com o propósito de resolver o problema.

## Especificações das Funcionalidades

- Utilizando a ferramenta adequada da sua linguagem/framework escolhida, crie de forma automatizada as tabelas do banco de dados relacional e mantenha o histórico de atualizações do schema.
- Automatize a inserção de dados fictícios para uso em ambiente de desenvolvimento.
- Implemente um endpoint para listar *cursos*. Permitindo filtrar pelo nome da universidade, kind, level e/ou shift.
- Implemente um endpoint que permita listar e filtrar *ofertas*. Permitindo filtrar pelo nome da universidade, nome do curso, kind, level, shift e/ou cidade. Além disso, deve ter a possibilidade de ordernar por menor e maior preço com desconto.
- O formato de retorno dos dados é JSON.

## Critérios de Avaliação

- Legibilidade
- Arquitetura e design da aplicação
- Performance
- Facilidade de evolução e manutenção da aplicação
- Testes automatizados
- Documentação

## Exemplo de Dados

Você pode visualizar o retorno esperado para o endpoint de ofertas no arquivo [db.json](db.json), anexo a este desafio.

A estrutura do JSON de ofertas é a seguinte:
```
  {
    "full_price": float,
    "price_with_discount": float,
    "discount_percentage": float,
    "start_date": string,
    "enrollment_semester": string,
    "enabled": boolean,
    "course": {
      "name": string,
      "kind": string,
      "level": string,
      "shift": string
    },
    "university": {
      "name": string,
      "score": float,
      "logo_url": string
    },
    "campus": {
      "name": string,
      "city": string
    }
  }
```
A estrutura do JSON de cursos é a seguinte:

```
  {
    "course": {
      "name": string,
      "kind": string,
      "level": string,
      "shift": string
      "university": {
        "name": string,
        "score": float,
        "logo_url": string
      },
      "campus": {
        "name": string,
        "city": string
      }
    }
  }
```

## Instruções para entrega do projeto

* Desenvolva e versione esse projeto utilizado git.
* Utilize o serviço de hospedagem de código de sua preferência: github, bitbucket, gitlab ou outro.
* Crie um README com instruções claras sobre como executar seu projeto.

## Bônus

- Implementar autenticação da API usando JWT
- Implementar cache nos endpoints
- Disponilizar sua aplicação online utilizando um serviço de sua preferência, como Heroku ou AWS, por exemplo

```
