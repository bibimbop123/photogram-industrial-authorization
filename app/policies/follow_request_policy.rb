class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def index?
    user.present?
  end

  def create?
    user.present? && user != follow_request.user
  end

  def update?
    user.present? && (user == follow_request.user || user == follow_request.follower)
  end

  def destroy?
    user.present? && (user == follow_request.user || user == follow_request.follower)
  end
end
