class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  
    private
    def authenticated?
      authenticate_or_request_with_http_basic do |email, password|
        resource = User.find_by_email(email)
        resource.valid_password?(password)
      end
    end

    def get_user
      authenticate_or_request_with_http_basic do |email, password|
        User.find_by_email(email)
      end
    end

    def compare_users
      unless correct_user_params?
        render json: { errors: "Unautorized access: User Id in HTTP request does not match email credentials" }, status: :unprocessable_entity
      end
    end
end