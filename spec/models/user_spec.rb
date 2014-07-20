require 'spec_helper'

describe User do
  context "fields" do
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
  end

  context "associations" do
    it { should have_many(:comments) }
    it { should have_many(:hotels) }
    it { should have_many(:ratings) }
  end
end
