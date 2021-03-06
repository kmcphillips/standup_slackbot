FactoryGirl.define do
  factory :standup do
    name "Candy team standup"
    hour 9
    minute 30
    days [1,2,3,4,5]

    after(:build) do |standup, evaluator|
      standup.questions << FactoryGirl.build(:question)
      standup.questions << FactoryGirl.build(:question)
    end
  end
end
