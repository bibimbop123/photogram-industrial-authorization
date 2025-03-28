class CommentPolicy < ApplicationPolicy
  # This policy class defines the permissions for comments in a photo-sharing application.
  # It checks if a user can create, update, destroy, or view comments based on their relationship
  # to the comment and the photo it belongs to.
  # The `attr_reader` method creates getter methods for the user and comment instances
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?
  end

  def update?
    user.present? && comment.author == user
  end

  def destroy?
    user == comment.author || user == comment.photo.owner
  end

  def index?
    true
  end

  def show?
    true
  end
end
