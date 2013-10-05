require 'cgi'

class Api < Grape::API
  format :json

  resources :projects do
    post do
      begin
        content = request.body.read

        attributes = CGI::parse(content)

        Rails.logger.debug "*" * 100
        Rails.logger.debug attributes
        Rails.logger.debug "*" * 100
      rescue => boom
        Rails.logger.error boom.message
        throw :error, :status => 400
      end
    end
  end
end

