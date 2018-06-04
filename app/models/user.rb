class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :company_name, :country, :time_zone, presence: true

  def username
    if email.present?
      self.email.split(/@/).first
    end
  end

end
