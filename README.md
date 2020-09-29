# Quero Backend Development Challenge 

<!-- TOC depthFrom:1 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Quero Backend Development Challenge](#quero-backend-development-challenge)
    - [Intro](#intro)
    - [O Desafio](#desafio)
    - [A API](#a-api)
        - [Estrutura para Courses](#estrutura-para-courses)
        - [Estrutura para Offers](#estrutura-para-offers)
    - [Endpoints Routes](#endpoints-routes)
    - [Queries](#queries)
    - [Filtros](#filtros)
    - [Ordenação](#ordenação)

<!-- /TOC -->

## Intro

Este projeto é a solução do desafio técnico de desenvolvimento backend proposto pela `QueroEducação` para o processo seletivo da vaga de `Desenvolvedor(a) Full Stack`. A solução foi desenvolvida inteiramente por [Alexandre Castello](https://github.com/alexandrecastello)

## O Desafio

```
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

## Bônus

- Implementar autenticação da API usando JWT
- Implementar cache nos endpoints
- Disponilizar sua aplicação online utilizando um serviço de sua preferência, como Heroku ou AWS, por exemplo

```

## A API

Esta API retorna seus resultados no formato JSON. A API foi desenvolvida em Ruby on Rails (framework baseado em MVC) com banco de dados relacionais em PostgreSQL. Ela tem duas estruturas de respostas: um para courses e outro para offers. 


### Estrutura para para `Courses`

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

### Estrutura para para `Offers`

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

## Endpoints Routes

Endpoints para `Courses`
```
GET /api/v1/courses
```

Endpoints para `Offers`
```
GET /api/v1/offers
```

## Queries

Queries podem ser usadas livremente como o exemplo a seguir:

```
https://quero-backend-challenge.herokuapp.com/api/v1/offers?course_shift=Virtual&university_name=UNICSUL&order=asc
```

## Filtros

Os parâmetros de filtros a seguir são suportados pela rota `/courses`:

| filtro     | possíveis valores | descrição|
|:-----------|:----------------|:-----------|
| `course_level` | `{string}`| metadata que inclua `{string}` |
| `course_kind` | `{string}`| metadata que inclua `{string}` |
| `course_shift` | `{string}`| metadata que inclua `{string}` |
| `university_name` | `{string}`| metadata que inclua `{string}` |


Os parâmetros de filtros a seguir são suportados pela rota `/offers`:

| filtro     | possíveis valores | descrição|
|:-----------|:----------------|:-----------|
| `course_name` | `{string}`| metadata que inclua `{string}` |
| `course_level` | `{string}`| metadata que inclua `{string}` |
| `course_kind` | `{string}`| metadata que inclua `{string}` |
| `course_shift` | `{string}`| metadata que inclua `{string}` |
| `university_name` | `{string}`| metadata que inclua `{string}` |
| `campus_city` | `{string}`| metadata que inclua `{string}` |

## Ordenação

A rota de `/offers` suporta a ordenação pela coluna `price_with_discount` ao utilizar o parâmetro `order` com as opções de `asc`, para valores crescentes, ou `desc`, para valores decrescentes.
