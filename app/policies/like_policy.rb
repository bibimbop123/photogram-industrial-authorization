class LikePolicy < ApplicationPolicy
  # This policy class is responsible for authorizing actions related to the Like model.
  # It checks if the user is present and if they have the appropriate permissions
  # to create, update, destroy, or view likes.

  # The `attr_reader` method creates getter methods for the user and like instances
  # so that they can be accessed within the policy methods.
  attr_reader :user, :like

  def initialize(user, like)
    @user = user
    @like = like
  end

  def create?
    user.present? && !user.likes.exists?(photo_id: like.photo_id)
  end
  
  def destroy?
    user.present? && user.likes.exists?(id: like.id)
  end

  def index?
    user.present?
  end
  def show?
    user.present? && user.likes.exists?(id: like.id)
  end

  def update?
    user.present? && user.likes.exists?(id: like.id)
  end

  def edit?
    update?
  end

  def new?
    create?
  end
end
