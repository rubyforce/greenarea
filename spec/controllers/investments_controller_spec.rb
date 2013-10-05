require 'spec_helper'

describe InvestmentsController do
  context 'when logged in' do
    before { logged_in }

    let!(:project) { create(:project) }

    describe 'GET :new' do
      before { get :new, project_id: project.to_param }

      it { should respond_with(:success) }
      it { should render_template('new') }
    end

    describe 'POST :create' do
      before { post :create, project_id: project.to_param, investment: attributes_for(:investment) }

      it { expect(Investment.count).to eq(1) }
      it { should redirect_to project_path(project) }

      it 'should create activity for the project' do
        expect(project.activities).to have(1).item
        expect(project.activities[0].key).to eq("project.user_invested")
        expect(project.activities[0].owner).to eq(current_user)
      end

      it 'should create activity for the current user' do
        expect(current_user.activities).to have(1).item
        expect(current_user.activities[0].key).to eq("user.project_invested")
        expect(current_user.activities[0].owner).to eq(project)
      end
    end

    describe 'POST :create raising the money' do
      it 'should raise money for the project' do
        # per_share = price / shares = 10 and quantity = 1
        post :create, project_id: project.to_param, investment: attributes_for(:investment, quantity: 1)
        expect(project.reload.raised).to eq(10)
        expect(project.reload.percent).to eq(10)

        # per_share = price / shares = 10 and quantity = 2
        post :create, project_id: project.to_param, investment: attributes_for(:investment, quantity: 3)
        expect(project.reload.raised).to eq(40)
        expect(project.reload.percent).to eq(40)
      end
    end

  end
end
