# GenReportParallel

Dez pessoas fizeram freelas para uma empresa X durante cinco anos e o histórico com todos os dados de cada uma dessas pessoas (nome, horas trabalhadas, dia, mês e ano) foram passadas para três arquivo CSV na seguinte ordem: nome, horas de trabalho no dia, dia referente às horas de trabalho, mês e ano. Esta aplicação gera um relatório, de forma paralela, a partir dos três arquivos com dados de cada pessoa, organizado em:

* Total de horas trabalhadas
* Quantidade de horas trabalhadas em cada mês
* Quantidade de horas trabalhadas em cada ano


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gen_report_parallel` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_report_parallel, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/gen_report_parallel](https://hexdocs.pm/gen_report_parallel).

