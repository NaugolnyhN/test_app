FactoryGirl.define do
  factory :user do
    name     "Nick"
    email    "ni@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end