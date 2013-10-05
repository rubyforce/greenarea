InvestmentsCreator = Struct.new(:user, :project) do
  def create(options = {})
    investment = Investment.new(options)
    investment.user = user
    investment.project = project
    # return result of the save method on tap
    investment.save.tap do |success|
      if success
        create_activities
        update_project_money(investment)
      end
    end
  end

  private

  def create_activities
    project.create_activity 'user_invested', owner: user
    user.create_activity 'project_invested', owner: project
  end

  def update_project_money(investment)
    project.raised = project.raised.to_f + investment.money
    project.percent = project.raised * 100 / project.price.to_f
    project.save
  end
end

