defmodule SprintPoker.State do
  use SprintPoker.Web, :model

  schema "states" do
    belongs_to :game, SprintPoker.Game, type: :binary_id
    field :current_ticket_id, :integer
    field :votes, :map, default: %{}
    field :name, :string
    timestamps
  end

  @required_fields ~w(game_id name)
  @optional_fields ~w(current_ticket_id votes)
  @state_names ~w(none voting review)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_inclusion(:name, @state_names)
  end
end
