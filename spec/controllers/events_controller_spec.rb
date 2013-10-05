require 'spec_helper'

describe EventsController do
  describe '#index' do
    before { get :index }

    it { should respond_with(200) }
  end
end

