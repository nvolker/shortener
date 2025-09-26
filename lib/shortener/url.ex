defmodule Shortener.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :original_url, :string
    field :slug, :string
    field :click_count, :integer, default: 0

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:original_url, :slug, :click_count])
    |> validate_required([:original_url, :slug])
    |> unique_constraint(:slug)
  end
end
