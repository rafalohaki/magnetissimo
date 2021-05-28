defmodule Magnetissimo.Torrents.Torrent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "torrents" do
    field :canonical_url, :string
    field :leechers, :string
    field :magnet_url, :string
    field :name, :string
    field :published_at, :naive_datetime
    field :seeders, :string
    field :size_in_bytes, :string

    timestamps()
  end

  @doc false
  def changeset(torrent, attrs) do
    torrent
    |> cast(attrs, [
      :name,
      :magnet_url,
      :canonical_url,
      :leechers,
      :seeders,
      :size_in_bytes,
      :published_at
    ])
    |> validate_required([
      :name,
      :magnet_url,
      :canonical_url,
      :leechers,
      :seeders,
      :size_in_bytes,
      :published_at
    ])
  end
end
