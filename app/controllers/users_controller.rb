class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
<<<<<<< HEAD

  def index

    @users = User.where(activated: FILL_IN).paginate(page: params[:page])

  end

  def new
    @user = User.new
=======
  def index
    @users = User.paginate(page: params[:page])
>>>>>>> advanced-login
  end

  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    redirect_to root_url and return unless FILL_IN
=======
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
>>>>>>> advanced-login
  end

  def create
    @user = User.new(user_params)
    if @user.save
<<<<<<< HEAD
      @user.send_activation_email
=======
      UserMailer.account_activation(@user).deliver_now
>>>>>>> advanced-login
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
<<<<<<< HEAD
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
=======

>>>>>>> advanced-login
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
<<<<<<< HEAD
    
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
=======

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
>>>>>>> advanced-login
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
<<<<<<< HEAD
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
    private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end


    # ログイン済みユーザーかどうか確認
    def logged_in_user

      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end

     # 正しいユーザーかどうか確認
     def correct_user

      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
=======
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # beforeフィルター

  # 正しいユーザーかどうかを確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 管理者かどうかを確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
>>>>>>> advanced-login
