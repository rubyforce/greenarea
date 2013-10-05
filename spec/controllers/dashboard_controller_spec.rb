require 'spec_helper'

describe DashboardController do
  context 'when logged in' do
    before { logged_in(:user) }

    describe '#index' do
      before { get :index }

      it { should respond_with(:success) }
    end
  end
end
