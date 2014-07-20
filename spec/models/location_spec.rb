require 'spec_helper'

describe Location do
  context "fields" do
    it { should respond_to(:country) }
    it { should respond_to(:state) }
    it { should respond_to(:city) }
    it { should respond_to(:street) }
  end

  context "validations" do
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:street) }
    it { should_not allow_value("a"*141).for(:country) }
    it { should_not allow_value("a"*141).for(:state) }
    it { should_not allow_value("a"*141).for(:city) }
    it { should_not allow_value("a"*141).for(:street) }
  end

  context "associations" do
    it { should belong_to(:hotel) }
  end
end
