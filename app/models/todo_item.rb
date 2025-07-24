class TodoItem < ApplicationRecord
  enum :status, { pending: 0, in_progress: 1, completed: 2 }

  validates :title, presence: true
  validates :status, presence: true

  scope :by_status, ->(status) { where(status: status) }
  scope :recent, -> { order(created_at: :desc) }

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :pending
  end
end
