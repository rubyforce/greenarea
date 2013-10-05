require 'spec_helper'

describe ProjectsController do
  render_views

  describe 'GET /index' do
    context 'with project' do
      let!(:projects) { 2.times.map { create(:project) } }

      before { get :index }

      it { should respond_with(:success) }

      it 'should pick up items' do
        collection = assigns(:projects)
        expect(collection).to have(2).items
        expect(collection).to include(projects[0])
        expect(collection).to include(projects[1])
      end
    end
  end

  describe 'GET /show' do
    context 'with project' do
      let!(:project) { create(:project) }

      before { get :show, id: project.to_param }

      it { should respond_with(:success) }

      it { expect(assigns(:project)).to eq(project) }
    end

    context 'without project' do
      before { get :show, id: 'invalid id' }

      it { should respond_with(404) }
    end
  end

  context 'GET /new' do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template('new') }
  end

  context 'POST /create' do
    before { get :create, :project => { name: 'new-name', description: 'new-description', latitude: 123, longitude: 321 } }

    it { should respond_with(:success) }

    it 'create a new marker or project' do
      project = Project.last
      project.name.should        == 'new-name'
      project.description.should == 'new-description'
      project.latitude.should    == 123
      project.longitude.should   == 321
    end
  end
end

