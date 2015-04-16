class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  
    private
    def authenticated?
      authenticate_or_request_with_http_basic do |email, password|
        resource = User.find_by_email(email)
        resource.valid_password?(password)
      end
    end
end