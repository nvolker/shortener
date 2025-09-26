defmodule Shortener.Url do
  use Ecto.Schema
  import Ecto.Changeset

  # Field length constraints - must match database migration constraints
  @max_original_url_length 2048  # Supports very long URLs including query parameters
  @max_slug_length 255           # Reasonable limit for short, memorable identifiers

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
    |> validate_length(:original_url, max: @max_original_url_length)
    |> validate_length(:slug, max: @max_slug_length)
    |> unique_constraint(:slug)
  end
end
