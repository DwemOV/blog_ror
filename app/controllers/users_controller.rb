class UsersController < ApplicationController


  def profile
      @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|

      if @user.update(user_params)
        format.html { redirect_to profile_users_path , notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render profile_users_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar)
  end
end