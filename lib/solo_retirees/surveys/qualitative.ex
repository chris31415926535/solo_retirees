defmodule SoloRetirees.Surveys.Qualitative do
  use Ecto.Schema
  import Ecto.Changeset

  schema "qualitative_responses" do
    field(:age, :string)
    field(:gender, :string)
    field(:gender_other, :string)
    field(:province, :string)
    field(:living_situation, :string)
    field(:living_situation_other, :string)
    field(:freetext, :string)
    field(:ip, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(qualitative, attrs) do
    qualitative
    |> cast(attrs, [
      :age,
      :province,
      :living_situation,
      :freetext,
      :ip,
      :gender,
      :gender_other,
      :living_situation_other
    ])
    |> validate_required(
      [:age, :province, :gender, :living_situation],
      message: "* Required"
    )
    |> validate_required(
      [:freetext],
      message: "Please describe your experience as a solo retiree."
    )

    # |> validate_required([:age], message: "Please enter your age.")
    # |> validate_required([:province], message: "Please select your province or territory.")
    # |> validate_required([:living_situation], message: "Please select your living situation.")
    # |> validate_required([:gender])
    # |> validate_required([:freetext],
    #   message: "Please describe your experience as a solo retiree."
    # )
  end
end
