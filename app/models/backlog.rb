# frozen_string_literal: true

class Backlog < ApplicationRecord
  has_many :backlog_entries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_later_to 'backlogs' }
  after_update_commit -> { broadcast_replace_later_to 'backlogs' }
  after_destroy_commit -> { broadcast_remove_to 'backlogs' }
  # broadcasts_to ->(backlog) { "backlogs" }, inserts_by: :prepend
end
