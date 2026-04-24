defmodule SoloRetirees.Surveys do
  @moduledoc """
  The Surveys context.
  """

  import Ecto.Query, warn: false
  alias SoloRetirees.Repo

  alias SoloRetirees.Surveys.Qualitative

  @doc """
  Returns the list of qualitative_responses.

  ## Examples

      iex> list_qualitative_responses()
      [%Qualitative{}, ...]

  """
  def list_qualitative_responses do
    Repo.all(Qualitative)
  end

  @doc """
  Gets a single qualitative.

  Raises `Ecto.NoResultsError` if the Qualitative does not exist.

  ## Examples

      iex> get_qualitative!(123)
      %Qualitative{}

      iex> get_qualitative!(456)
      ** (Ecto.NoResultsError)

  """
  def get_qualitative!(id), do: Repo.get!(Qualitative, id)

  @doc """
  Creates a qualitative.

  ## Examples

      iex> create_qualitative(%{field: value})
      {:ok, %Qualitative{}}

      iex> create_qualitative(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_qualitative(attrs \\ %{}) do
    %Qualitative{}
    |> Qualitative.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a qualitative.

  ## Examples

      iex> update_qualitative(qualitative, %{field: new_value})
      {:ok, %Qualitative{}}

      iex> update_qualitative(qualitative, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_qualitative(%Qualitative{} = qualitative, attrs) do
    qualitative
    |> Qualitative.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a qualitative.

  ## Examples

      iex> delete_qualitative(qualitative)
      {:ok, %Qualitative{}}

      iex> delete_qualitative(qualitative)
      {:error, %Ecto.Changeset{}}

  """
  def delete_qualitative(%Qualitative{} = qualitative) do
    Repo.delete(qualitative)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking qualitative changes.

  ## Examples

      iex> change_qualitative(qualitative)
      %Ecto.Changeset{data: %Qualitative{}}

  """
  def change_qualitative(%Qualitative{} = qualitative, attrs \\ %{}) do
    Qualitative.changeset(qualitative, attrs)
  end
end
