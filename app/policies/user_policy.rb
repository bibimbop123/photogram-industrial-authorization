class UserPolicy < ApplicationPolicy
  # This policy class defines permissions for user actions
  # It assumes that the user and record are both instances of User

  # The user is the one trying to perform an action
  # The record is the user whose profile is being accessed
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user == current_user
  end

  def destroy?
    user == current_user
  end

  def feed?
    true
  end

  def discover?
      user.present? && !user.private?
  end


  def show_photos?
    user == record || user == current_user ||
    !record.private? || 
    record.followers.include?(current_user)
  end
end
