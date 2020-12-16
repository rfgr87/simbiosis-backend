class ThemesController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end

    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: {error: 'Error creating museum'}
      end
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end

    def update
      @user = User.find(params[:id])
      @user.update(name: params["name"])
      @user.save
      render json: @user
    end

    private

    def user_params
      params.require(:name).permit(:name)
    end


end