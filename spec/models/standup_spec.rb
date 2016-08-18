require 'rails_helper'

RSpec.describe Standup, type: :model do
  let(:standup) { FactoryGirl.create(:standup) }
  subject { standup }

  context "validations" do
    subject { FactoryGirl.build(:standup) }

    it "is valid" do
      expect(subject).to be_valid
    end

    shared_examples "invalid hours" do |hour:|
      it "checks for valid hours" do
        subject.hour = hour
        expect(subject).to have(1).error_on(:hour)
        expect(subject.errors_on(:hour)).to include("is not a valid time")
      end
    end

    it_behaves_like "invalid hours", hour: -1
    it_behaves_like "invalid hours", hour: 24
    it_behaves_like "invalid hours", hour: 99999

    shared_examples "invalid minutes" do |minute:|
      it "checks for valid minutes" do
        subject.minute = minute
        expect(subject).to have(1).error_on(:minute)
        expect(subject.errors_on(:minute)).to include("is not a valid time")
      end
    end

    it_behaves_like "invalid minutes", minute: -1
    it_behaves_like "invalid minutes", minute: 60
    it_behaves_like "invalid minutes", minute: 99999

    it "checks days cannot be empty" do
      subject.days = []
      expect(subject).to have(1).error_on(:days)
      expect(subject.errors_on(:days)).to include("cannot be blank")
    end

    shared_examples "invalid week days" do |days:|
      it "checks days has valid week days" do
        subject.days = days
        expect(subject).to have(1).error_on(:days)
        expect(subject.errors_on(:days)).to include("are not valid days")
      end
    end

    it_behaves_like "invalid week days", days: [-1]
    it_behaves_like "invalid week days", days: [3, -234]
    it_behaves_like "invalid week days", days: [8]
    it_behaves_like "invalid week days", days: [0]
    it_behaves_like "invalid week days", days: [9, 999999]

    it "has many questions" do
      subject.questions = []
      expect(subject).to have(1).error_on(:questions)
      expect(subject.errors_on(:questions)).to include("must not be empty")
    end

    it "validates associates for questions" do
      subject.questions = [FactoryGirl.build(:question, body: nil)]
      expect(subject).to have(1).error_on(:questions)
      expect(subject.errors_on(:questions)).to include("is invalid")
    end
  end

  describe "#timezone" do
    it "is EST for now" do
      expect(subject.timezone).to eq("EST")
    end
  end

  describe "#display_schedule" do
    it "puts together time and zone and days" do
      expect(subject.display_schedule).to eq("09:30 on Monday, Tuesday, Wednesday, Thursday, Friday")
    end
  end

  describe "#display_weekdays" do
    it "displays the days" do
      subject.days = [4, 0, 2]
      expect(subject.display_weekdays).to eq("Sunday, Tuesday, Thursday")
    end
  end
end
