module DashboardHelper
  def projects_json(projects)
    projects.to_json(only: [:name, :latitude, :longitude], methods: :address)
  end

  def user_json(user)
    user.to_json(only: [:latitude, :longitude])
  end
end

