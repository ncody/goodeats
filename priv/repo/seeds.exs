# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Goodeats.Repo.insert!(%Goodeats.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Goodeats.Repo
alias Goodeats.Blog
alias Goodeats.Blog.{Country, City, Restaurant}
alias Goodeats.Account.{User, UserRestaurant}

us =
  Repo.insert!(%Country{
    name: "United States"
  })

spain =
  Repo.insert!(%Country{
    name: "Spain"
  })

chicago =
  Repo.insert!(%City{
    name: "Chicago",
    country: us
  })

minneapolis =
  Repo.insert!(%City{
    name: "Minneapolis"
  })

cruz_blanca =
  Repo.insert!(%Restaurant{
    name: "Cruz Blanca",
    cuisine: "Mexican",
    description: "Rick Bayless restaurant in Fulton Market",
    city: chicago
  })

Repo.insert!(%Restaurant{
  name: "Piccolo Sogno",
  cuisine: "Italian",
  city: chicago
})

somerset =
  Repo.insert!(%Restaurant{
    name: "Somerset",
    cuisine: "American",
    city: chicago
  })

Repo.insert!(%Restaurant{
  name: "Portafino",
  cuisine: "Italian",
  city: chicago
})

user =
  Repo.insert!(%User{
    username: "nicole"
  })

Repo.insert!(%UserRestaurant{
  user: user,
  restaurant: cruz_blanca,
  tried: "yes",
  rating: 4
})

Repo.insert!(%UserRestaurant{
  user: user,
  restaurant: cruz_blanca,
  tried: "yes",
  rating: 4
})

Repo.insert!(%UserRestaurant{
  user: user,
  restaurant: somerset,
  tried: "want to try"
})
