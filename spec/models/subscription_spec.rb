require 'spec_helper'

describe Subscription do
  it { should validate_presence_of(:email) }
end

