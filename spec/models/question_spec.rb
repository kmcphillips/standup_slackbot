require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { FactoryGirl.create(:question) }
  subject { question }

  context "validations" do
    subject { FactoryGirl.build(:question_with_standup) }

    it "is valid" do
      expect(subject).to be_valid
    end

    it "requires a body" do
      subject.body = ""
      expect(subject).to have(1).error_on(:body)
      expect(subject.errors_on(:body)).to include("can't be blank")
    end

    it "requires a body" do
      subject = FactoryGirl.build(:question)
      expect(subject).to have(1).error_on(:standup)
      expect(subject.errors_on(:standup)).to include("can't be blank")
    end
  end
end
