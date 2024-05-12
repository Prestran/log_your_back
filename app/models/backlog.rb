# frozen_string_literal: true

class Backlog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,        type: String
  field :type,        type: String
  field :content,     type: Hash
  field :due_at,      type: Date
end
