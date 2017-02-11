class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :ensure_correct_user, only: [:update, :destroy]

  def me
    render json: { user: current_user }
  end

  # GET /users
  def index
    @users = User.all
    @team = Team.find(user_params["team_id"]) if user_params["team_id"]

    render json: { users: @team ? @team.users : @users }
  end

  # GET /users/1
  def show
    render json: { user: @user }
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def ensure_correct_user
      head :forbidden unless current_user == @user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:email, :username, :profile_text, :team_id, :provider, :uid)
    end
end
