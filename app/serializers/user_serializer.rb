class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :email, :company_name

  has_many :events
end
