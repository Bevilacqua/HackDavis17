class MembershipsController < ApplicationController
  before_filter :authorize

  # create
  # ======
  def create
    membership = Membership.new(membership_params)
    membership.user = current_user

    if membership.save
      redirect_to membership.group, notice: "Welcome to the group!"
    else
      redirect_to root_path, notice: "Fatal error!"
    end
  end

  private

  def membership_params
    params.permit(:group_id, :user_id)
  end
end
