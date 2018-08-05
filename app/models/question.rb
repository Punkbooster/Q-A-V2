class Question < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, :contents, presence: true

  default_scope { order(cached_weighted_score: :desc) }

  acts_as_votable
end
