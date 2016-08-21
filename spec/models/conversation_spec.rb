require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:conversation) { FactoryGirl.create(:conversation) }
  let(:user) { conversation.user }
  let(:standup) { conversation.standup }

  subject { conversation }

  context "validations" do
    subject { FactoryGirl.build(:conversation) }

    it "is valid" do
      expect(subject).to be_valid
    end

    it "requires a user" do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it "requires a standup" do
      subject.standup = nil
      expect(subject).to_not be_valid
    end
  end
end
