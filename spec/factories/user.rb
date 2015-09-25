FactoryGirl.define do
  factory :user do
    username "bdoodle"
    password "123456789"
    password_confirmation "123456789"
    email "bobbydoodle@bd.com"
    confirmed_at Time.now
  end
end
    