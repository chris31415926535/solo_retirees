defmodule SoloRetirees.Repo.Migrations.CreatePageHits do
  use Ecto.Migration

  def change do
    create table(:page_hits) do
      add :path, :string
      add :ip, :string

      timestamps(type: :utc_datetime)
    end
  end
end
