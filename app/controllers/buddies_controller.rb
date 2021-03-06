class BuddiesController < ApplicationController

  def show
    @buddy = Buddy.find( params[:id] )
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new( params[:buddy] )
    if @buddy.save
      sign_in @buddy
      flash.now[:success] = "Welcome to Buddy Balance!"
      redirect_to @buddy
    else
      render 'new'
    end
  end
end
