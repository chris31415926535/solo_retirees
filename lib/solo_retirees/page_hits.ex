defmodule SoloRetirees.PageHits do
  @moduledoc """
  The PageHits context.
  """

  import Ecto.Query, warn: false
  alias SoloRetirees.Repo

  alias SoloRetirees.PageHits.PageHit

  @doc """
  Returns the list of page_hits.

  ## Examples

      iex> list_page_hits()
      [%PageHit{}, ...]

  """
  def list_page_hits do
    Repo.all(PageHit)
  end

  @doc """
  Gets a single page_hit.

  Raises `Ecto.NoResultsError` if the Page hit does not exist.

  ## Examples

      iex> get_page_hit!(123)
      %PageHit{}

      iex> get_page_hit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_page_hit!(id), do: Repo.get!(PageHit, id)

  @doc """
  Creates a page_hit.

  ## Examples

      iex> create_page_hit(%{field: value})
      {:ok, %PageHit{}}

      iex> create_page_hit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_page_hit(attrs \\ %{}) do
    %PageHit{}
    |> PageHit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a page_hit.

  ## Examples

      iex> update_page_hit(page_hit, %{field: new_value})
      {:ok, %PageHit{}}

      iex> update_page_hit(page_hit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_page_hit(%PageHit{} = page_hit, attrs) do
    page_hit
    |> PageHit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a page_hit.

  ## Examples

      iex> delete_page_hit(page_hit)
      {:ok, %PageHit{}}

      iex> delete_page_hit(page_hit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_page_hit(%PageHit{} = page_hit) do
    Repo.delete(page_hit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking page_hit changes.

  ## Examples

      iex> change_page_hit(page_hit)
      %Ecto.Changeset{data: %PageHit{}}

  """
  def change_page_hit(%PageHit{} = page_hit, attrs \\ %{}) do
    PageHit.changeset(page_hit, attrs)
  end
end
