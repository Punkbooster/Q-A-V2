FactoryBot.define do
  factory :event do
    title 'Event name'
    starts_at Time.zone.now + 2.days
    ends_at Time.zone.now + 3.days
    user factory: :user
  end
end
