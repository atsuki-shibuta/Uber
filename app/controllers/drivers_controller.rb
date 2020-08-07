class DriversController < ApplicationController
	
	def index
	end

	def show
		@driver = current_driver
		@requests = @driver.accepted_requests
	end

	def new
		@driver = Driver.order(id: :desc)
	end

	def create
		@driver = Driver.new(drier_params)
  	if @driver.save
    	flash[:success] = 'アッシーを登録しました。'
    	redirect_to root_path
  	else
    	flash.now[:danger] = 'アッシーの登録に失敗しました。'
    	render :new
  	end
	end

end
