class InvestmentsController < ApplicationController
  before_filter :find_project
  before_filter :authenticate_user!

  def new
    @investment = @project.investments.new
  end

  def create
    investments = InvestmentsCreator.new(current_user, @project)

    if investments.create(params[:investment])
      gflash(success: "Investment was created")
      redirect_to @project
    else
      gflash(errors: "Something went wrong")
      render :new
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id]).decorate
  end
end

