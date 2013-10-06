require 'cgi'

class Api < Grape::API
  format :json

  helpers do
    def project_attributes
      {
        image: request.body,
        name: params[:title],
        latitude: params[:latitude],
        longitude: params[:longitude]
      }
    end
  end
  resources :projects do
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

