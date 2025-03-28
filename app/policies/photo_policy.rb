class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show_photos?
    user == current_user ||
     !user.private? || 
     user.followers.include?(current_user)
  end

  def index?
    true
  end

  def create?
   user.present?
  end

  def update?
    user == @photo.owner
  end

  def destroy?
    user == @photo.owner
  end
end
