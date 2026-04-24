defmodule SoloRetirees.PageHitsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoloRetirees.PageHits` context.
  """

  @doc """
  Generate a page_hit.
  """
  def page_hit_fixture(attrs \\ %{}) do
    {:ok, page_hit} =
      attrs
      |> Enum.into(%{
        ip: "some ip",
        path: "some path"
      })
      |> SoloRetirees.PageHits.create_page_hit()

    page_hit
  end
end
