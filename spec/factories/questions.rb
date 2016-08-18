FactoryGirl.define do
  factory :question do
    sequence(:body) {|n| "This is question #{ n }" }
  end

  factory :question_with_standup, class: Question do
    sequence(:body) {|n| "This is question #{ n }" }
    standup
  end
end
