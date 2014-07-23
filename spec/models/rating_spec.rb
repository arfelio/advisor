require 'spec_helper'

describe Rating do
  context "fields" do
    it { should respond_to(:rating) }
    it { should respond_to(:hotel_id) }
    it { should respond_to(:user_id) }
  end

  context "validations" do
    it { should validate_presence_of(:rating) }
    it { should_not allow_value(6).for(:rating) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:hotel) }
  end
end
