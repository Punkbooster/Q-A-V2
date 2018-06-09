class Event < ApplicationRecord
  belongs_to :user

  validates :title, :starts_at, :ends_at, :user, presence: true
  validates :title, :description, length: { maximum: 100 }
end
