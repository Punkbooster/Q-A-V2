class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :questions

  validates :email, :company_name, :country, :time_zone, presence: true

  def username
    if email.present?
      self.email.split(/@/).first
    end
  end

  acts_as_voter
end
