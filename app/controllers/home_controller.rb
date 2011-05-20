class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tweets = current_user.tweets
  end

  def my_tweets
    @tweets = current_user.tweets

    respond_to do |format|
      format.js { render 'tweets' }
    end
  end

  def all_tweets
    @tweets = Tweet.all

    respond_to do |format|
      format.js { render 'tweets' }
    end
  end

  def add_tweet
    current_user.tweets = params[:content]
    @tweets = eval(params[:tweets])

    respond_to do |format|
      format.js { render 'tweets' }
    end
  end

end
