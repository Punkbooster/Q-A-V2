class Event < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :user
  has_many :questions
  scope :finito, -> { where("ends_at < ?", Time.zone.now) }
  scope :active, -> { where('ends_at > ?', Time.zone.now) }
  extend FriendlyId
  friendly_id :password, use: :slugged

  validates :title, :password, :starts_at, :ends_at, :user, :time_zone, presence: true
  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 2000 }
  validates :password, uniqueness: true
  validate :starts_at_cannot_be_in_the_past
  validate :ends_at_can_not_be_before_starts_at

  default_scope { order(created_at: :desc) }

  before_validation :set_password, on: :create
  before_validation :set_default_start_end_time_zone, on: :create
  after_create :add_slug

  def status
    if starts_at > Time.now && ends_at > Time.now
      "not started"
    elsif starts_at < Time.now && ends_at > Time.now
      "live"
    elsif starts_at < Time.now && ends_at < Time.now
      "finished"
    else
      'ERROR'
    end
  end

  def status_2
    if status == 'not started'
      "starts in #{distance_of_time_in_words(Time.now, starts_at)}"
    elsif status == 'live'
      "ends in #{distance_of_time_in_words(Time.now, ends_at)}"
    elsif status == 'finished'
      nil
    else
      'ERROR'
    end
  end

  def vote_quantity
    questions.map(&:weighted_score).sum
  end

  private

  def add_slug
    self.update_attributes!(slug: password)
  end

  def set_password
    self.password = generate_token
  end

  def set_default_start_end_time_zone
    self.starts_at = Time.zone.now + 1.hour
    self.ends_at = Time.zone.now + 2.hours
    self.time_zone = user.time_zone
  end

  def generate_token
    loop do
      #token = SecureRandom.hex(6)
      token = rand(999999)
      break token unless Event.where(password: token).exists?
    end
  end

  def starts_at_cannot_be_in_the_past
    if starts_at.present? && starts_at <= Time.now
      errors.add(:starts_at, "- You can not start an event in the past")
    end
  end

  def ends_at_can_not_be_before_starts_at
    if ends_at.present? && ends_at <= starts_at
      errors.add(:ends_at, "- Event can not end before it starts")
    end
  end

end
