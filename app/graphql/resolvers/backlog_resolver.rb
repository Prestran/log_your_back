module Resolvers
  class BacklogResolver < BaseResolver
    type Types::BacklogType, null: false
    argument :id, ID

    def resolve(id:)
      Backlog.object_from_id(id)
    end
  end
end