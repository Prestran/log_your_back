# frozen_string_literal: true

class Backlog
  validates :name, presence: true, length: { maximum: 50 }
end
