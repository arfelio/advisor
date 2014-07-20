require 'spec_helper'

describe Comment do

  context "fields" do
    it { should respond_to(:content) }
    it { should respond_to(:hotel_id) }
    it { should respond_to(:user_id) }
  end

  context 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:hotel_id) }
    it { should validate_presence_of(:user_id) }
    it { should_not allow_value("1"*251).for(:content) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:hotel) }
  end
end
