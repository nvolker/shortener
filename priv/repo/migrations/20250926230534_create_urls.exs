defmodule Shortener.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :original_url, :string
      add :slug, :string
      add :click_count, :integer, default: 0, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:urls, [:slug])
  end
end
