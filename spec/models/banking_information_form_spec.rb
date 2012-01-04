require 'spec_helper'

describe BankingInformationForm do
  it { should belong_to(:client_application) }
end
