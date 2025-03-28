class UsersController < ApplicationController
  before_action :set_user, only: %i[show liked discover feed]
  before_action { authorize(@user || User) }
  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def show
    @photos = @user.own_photos
  end

  def feed
    @photos = @user.own_photos
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_user
    if params[:username]
      @user = User.find_by!(username: params.fetch(:username))
    elsif current_user
      @user = current_user
    else
      redirect_to root_url, alert: "User not found."
    end
  end
end
