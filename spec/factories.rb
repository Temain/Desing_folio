FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    role_id 1
  end

  factory :micropost do
    title "Title"
    content "Lorem ipsum"
    user
  end
end