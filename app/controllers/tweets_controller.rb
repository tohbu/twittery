class TweetsController < ApplicationController

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
			redirect_to root_path
		else
			render :new
		end
	end

	def index
		@tweets = Tweet.order(created_at: :desc)
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		Tweet.find(params[:id]).destroy
		flash[:success] = "User deleted"
		redirect_to tweets_path
	end	

	private

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end
