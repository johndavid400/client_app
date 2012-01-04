require 'spec_helper'

describe Attachment do
  it { should belong_to(:client_application) }
end
