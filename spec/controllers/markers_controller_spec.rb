require 'spec_helper'

describe MarkersController do
  describe 'GET /new' do
    before { get :new }

    it { should respond_with(:success) }
    it { should render_template('new') }
  end

  describe 'POST /create' do
    before { 
  end
end
