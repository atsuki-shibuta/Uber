class UsersController < ApplicationController

	def index
	end

	def show
		@user = current_user
		@requests = @user.accepted_requests
	end

	def new
		@user = User.order(id: :desc)
	end

	def create
		@user = User.new(user_params)
  	if @user.save
    	flash[:success] = 'あなたを登録しました。'
    	redirect_to root_path
  	else
    	flash.now[:danger] = 'あなたの登録に失敗しました。'
    	render :new
  	end
	end

end
