class RequestsController < ApplicationController
	before_action :authenticate_user!

  def index
      @requests = Request.all.order(id: :desc)
  end
      
  def new
      @request = Request.new
  end

  def create
      @request = Request.new(request_params)
      if @request.save
	      flash[:notice] = "投稿が保存されました"
      	redirect_to root_path
      else
      	flash[:alert] = "投稿に失敗しました"
      	render :new
      end
  end

	private
    def request_params
      params.require(:request).permit(:start, :goal, :cost).merge(user_id: current_user.id)
    end

end
