module Types
  class BacklogType < Types::BaseObject
    description "A backlog entry"

    field :name, String, null: false
    field :type, String, null: false
    field :content, GraphQL::Types::JSON, null: false
    field :due_at, GraphQL::Types::ISO8601Date, null: false
  end
end
