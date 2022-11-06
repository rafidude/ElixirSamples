# People

```
import People
 p = new()
 p = create(p, %{name: "John", age: 24})
 p = create(p, %{name: "Jane", age: 23})
 p = create(p, %{name: "Mary", age: 23})
 read(23)
```

# Server

```
import Server
{:ok, pid} = start
add_person pid, %{name: "John", age: 24}
add_person pid, %{name: "Jane", age: 23}
add_person pid, %{name: "Mary", age: 23}
people_by_age pid, 23
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `people` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:people, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/people>.
