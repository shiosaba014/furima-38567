class UsersController < ApplicationController
  def show
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to action: "show"
    end
  end

  private

  def uaer_params
    params.require(:user).permit(:nickname,:email)
  end
end
