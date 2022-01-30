# YNAB

This is an elixir wrapper around the [YNAB API.](https://api.youneedabudget.com/v1) It includes most endpoints. Since I wrote this for my personal needs:

1. Not all endpoints are included, but as I need more, I'll add more. Feel free to make a pull request for features that you want or need.
2. It's untested. I don't like that, but I needed to get it up and running :)

## Installation

The package can be installed by adding `ynab` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ynab, "~> 1.0.0"}
  ]
end
```

## Usage

API calls happen in the client. If there is an error, the response will be a 2-item tuple, where the first element is `:error` and the second is the error: `{:error, error_http_response}`

Success responses will be a 3- item tuple, where the first element is `:ok`, the 2nd element is the raw HTTP response, and the 3rd is the requested or created resource(s): `{:ok, http_response, resource}`

This lib uses [HTTPoison](https://github.com/edgurgel/httpoison) under the hood, therefore the raw responses/errors are HTTPoison responses: `HTTPoison.Error{}` or `HTTPoison.Response`
