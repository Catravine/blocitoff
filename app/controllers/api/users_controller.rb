class Api::UsersController < ApiController

  before_action :authenticated?

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def show
    user = User.find(params[:id])
    render json: user, each_serializer: UserSerializer
  end

end
