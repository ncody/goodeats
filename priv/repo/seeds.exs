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

Repo.insert!(%Restaurant{
  name: "Cruz Blanca",
  cuisine: "Mexican",
  description: "Rick Bayless restaurant in Fulton Market",
  tried: "yes",
  rating: 4,
  city: chicago
})

Repo.insert!(%Restaurant{
  name: "Picolo Sogno",
  cuisine: "Italian",
  tried: "want to try",
  city: chicago
})

Repo.insert!(%Restaurant{
  name: "Portafino",
  cuisine: "Italian",
  tried: "no",
  city: chicago
})
