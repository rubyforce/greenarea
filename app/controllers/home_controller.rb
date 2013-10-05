class HomeController < ApplicationController
  def index
    @projects = ProjectsDecorator.decorate(Project.order('created_at desc').limit(2).all)
  end
end

