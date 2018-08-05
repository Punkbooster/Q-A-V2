class EventSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :description, :starts_at, :ends_at

  has_many :questions, serializer: QuestionSerializer
  belongs_to :user
end
