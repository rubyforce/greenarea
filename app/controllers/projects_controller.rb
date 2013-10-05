class ProjectsController < ApplicationController
  before_filter :find_project, only: :show

	def index
    @projects = ProjectsDecorator.decorate(Project.page(params[:page]))
	end

  def show
    @activities = @project.activities.includes(:user).includes(:trackable).order('created_at desc').limit(15).load
    @investors = @project.investors.load
    @project = @project.decorate
  end

  def new
    render :layout => false
  end

  def create
    project = Project.create!(params[:project])
    render :json => project.to_json(:only => [:name, :latitude, :longitude])
  end

  private

  def find_project
    @project = Project.includes(:investors).find(params[:id])
  end
end

