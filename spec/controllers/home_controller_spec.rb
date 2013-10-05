require 'spec_helper'

describe HomeController do
  describe '#index' do
    context 'with users' do
      before { logged_in(:user) }
      let!(:users) { create_list(:user, 2) }
      let!(:projects) { create_list(:project, 3) }

      before { get :index }

      it { should respond_with(:success) }

      it 'should pick up only 2 projects' do
        collection = assigns(:projects)
        expect(collection).to have(2).items
      end
    end
  end
end
