class QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :contents, :weighted_score, :id

  belongs_to :event
  belongs_to :user
end
