require 'spec_helper'

describe PrincipalInformationForm do
  it { should belong_to(:client_application) }
end
