FactoryGirl.define do
  factory :User do |f|
    f.first_name "John"
    f.last_name "Doe"
    f.sequence(:email) {|n| "user#{n}@gmail.com" }
    f.uid "auth0|583a0077cb79a5fe59340142"
    f.password "jacobsucks"
  end
end
