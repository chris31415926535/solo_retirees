defmodule SoloRetirees.SurveysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SoloRetirees.Surveys` context.
  """

  @doc """
  Generate a qualitative.
  """
  def qualitative_fixture(attrs \\ %{}) do
    {:ok, qualitative} =
      attrs
      |> Enum.into(%{
        age: "some age",
        freetext: "some freetext",
        living_situation: "some living_situation",
        province: "some province"
      })
      |> SoloRetirees.Surveys.create_qualitative()

    qualitative
  end
end
