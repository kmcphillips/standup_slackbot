FactoryGirl.define do
  factory :participation do
    user factory: :user
    standup factory: :standup
  end
end
