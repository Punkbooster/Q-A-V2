FactoryBot.define do
  factory :question do
    contents 'Is this real life?'
    user factory: :user
    event factory: :event
  end
end
