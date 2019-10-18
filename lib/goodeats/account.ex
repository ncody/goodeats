defmodule Goodeats.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Goodeats.Repo

  alias Goodeats.Account.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    Repo.one(
      from(user in User,
        where: user.id == ^id,
        left_join: users_restaurants in assoc(user, :users_restaurants),
        left_join: restaurant in assoc(users_restaurants, :restaurant),
        preload: [users_restaurants: {users_restaurants, restaurant: restaurant}]
      )
    )
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Goodeats.Account.UserRestaurant

  @doc """
  Returns the list of users_restaurants.

  ## Examples

      iex> list_users_restaurants()
      [%UserRestaurant{}, ...]

  """
  def list_users_restaurants do
    Repo.all(UserRestaurant)
  end

  @doc """
  Gets a single user_restaurant.

  Raises `Ecto.NoResultsError` if the User restaurant does not exist.

  ## Examples

      iex> get_user_restaurant!(123)
      %UserRestaurant{}

      iex> get_user_restaurant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_restaurant!(id) do
    UserRestaurant
    |> Repo.get!(id)
    |> Repo.preload(:user)
    |> Repo.preload(:restaurant)
  end

  @doc """
  Creates a user_restaurant.

  ## Examples

      iex> create_user_restaurant(%{field: value})
      {:ok, %UserRestaurant{}}

      iex> create_user_restaurant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_restaurant(attrs \\ %{}) do
    %UserRestaurant{}
    |> UserRestaurant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_restaurant.

  ## Examples

      iex> update_user_restaurant(user_restaurant, %{field: new_value})
      {:ok, %UserRestaurant{}}

      iex> update_user_restaurant(user_restaurant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_restaurant(%UserRestaurant{} = user_restaurant, attrs) do
    user_restaurant
    |> UserRestaurant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserRestaurant.

  ## Examples

      iex> delete_user_restaurant(user_restaurant)
      {:ok, %UserRestaurant{}}

      iex> delete_user_restaurant(user_restaurant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_restaurant(%UserRestaurant{} = user_restaurant) do
    Repo.delete(user_restaurant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_restaurant changes.

  ## Examples

      iex> change_user_restaurant(user_restaurant)
      %Ecto.Changeset{source: %UserRestaurant{}}

  """
  def change_user_restaurant(%UserRestaurant{} = user_restaurant) do
    UserRestaurant.changeset(user_restaurant, %{})
  end
end
