# frozen_string_literal: true

class Backlog < ApplicationRecord
  has_many :backlog_entries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
