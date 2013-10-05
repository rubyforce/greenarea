require 'spec_helper'

describe Investment do
  it { should belong_to(:user) }
  it { should belong_to(:project) }
end

