require 'rails_helper'

RSpec.describe Participation, type: :model do
  let(:participation) { FactoryGirl.create(:participation) }
  let(:user) { participation.user }
  let(:standup) { participation.standup }

  subject { participation }

  context "validations" do
    subject { FactoryGirl.build(:participation) }

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
