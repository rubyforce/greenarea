class HomeController < ApplicationController
  def index
    @projects = ProjectsDecorator.decorate(Project.order('created_at desc').all)
  end
end

