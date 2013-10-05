require 'spec_helper'

describe PostDecorator do 
  describe '.created_at' do
    let(:decorated) { create(:post, created_at: Date.parse("12.07.2013")).decorate }

    it { expect(decorated.created_at).to eq("Friday, July 12") }
  end
end
