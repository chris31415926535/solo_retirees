defmodule SoloRetirees.Repo.Migrations.CreateQualitativeResponses do
  use Ecto.Migration

  def change do
    create table(:qualitative_responses) do
      add(:age, :string)
      add(:province, :string)
      add(:gender, :string)
      add(:gender_other, :string)
      add(:living_situation, :string)
      add(:living_situation_other, :string)
      add(:freetext, :string)
      add(:ip, :string)

      timestamps(type: :utc_datetime)
    end
  end
end
