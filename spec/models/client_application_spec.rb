require 'spec_helper'

describe ClientApplication do
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:business_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:business_name) }
  it { should_not allow_value("tom.tom.com").for(:email) }
  it { should allow_value("tom@tom.com").for(:email) }

  it { should belong_to(:user) }
  it { should belong_to(:state) }
  it { should have_many(:attachments) }
  it { should have_many(:principal_information_forms) }
  it { should have_many(:banking_information_forms) }
end
