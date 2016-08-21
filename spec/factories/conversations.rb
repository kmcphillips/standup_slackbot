FactoryGirl.define do
  factory :conversation do
    user factory: :user
    standup factory: :standup
  end
end
