FactoryBot.define do
  factory :user do
    email 'test@test.com'
    password '1234test'
    company_name 'Askdemos'
    country 'Poland'
    time_zone 'London'
  end
end
