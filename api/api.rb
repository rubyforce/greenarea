require 'cgi'

class Api < Grape::API
  format :json

  helpers do
    def project_attributes
      {
        image:     params[:userfile][:tempfile],
        name:      params[:title],
        latitude:  params[:latitude],
        longitude: params[:longitude]
      }
    end
  end
  resources :projects do
    get do
      Project.all.map do |project|
        {
          title: project.name,
          latitude: project.latitude,
          longitude: project.longitude
        }
      end
    end

    params do
      requires :title
      requires :latitude
      requires :longitude
    end
    post do
      begin
        Project.create!(project_attributes)
      rescue => boom
        Rails.logger.error boom.message
        throw :error, :status => 400
      end
    end
  end
end

