class ProfilesController < ApplicationController

  def new
    # form were a user can fill out their own profile
    @user = User.find params[:user_id]
    @profile = Profile.new
  end

  def create
    @user = User.find params[:user_id]
    @profile = @user.build_profile profile_params

    if @profile.save
      flash[:success] = 'Profile has been created.'
      redirect_to user_path params[:user_id]
    else
      render action: :new
    end
  end

  def edit
    @user = User.find params[:user_id]
    @profile = @user.profile
  end

  def update
    
  end

  private

    def profile_params
      params.require(:profile).permit :first_name, :last_name, :job_title,
                                      :contact_email, :description
    end
end
