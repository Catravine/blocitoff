class ApiController < ApplicationController

  before_filter :authenticated?

  skip_before_action :verify_authenticity_token

  respond_to :json

  private

  def authenticated?
    sign_in User.where(email: "catravine@hotmail.com")
    #authenticate_or_request_with_http_basic do |username, password|
      #resource = User.find_by_email(username)
      #if resource.valid_password?(password)
        #sign_in :user, resource
      #end
    #end
  end

end
