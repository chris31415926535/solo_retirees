defmodule SoloRetirees.PageHits.PageHit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "page_hits" do
    field(:path, :string)
    field(:ip, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page_hit, attrs) do
    page_hit
    |> cast(attrs, [:path, :ip])
    |> validate_required([:path])
  end
end
