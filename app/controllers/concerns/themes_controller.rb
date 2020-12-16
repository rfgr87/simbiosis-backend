class ThemesController < ApplicationController

    def index
      @themes = Theme.all
      render json: @themes
    end

    def create
      @theme = Theme.new(theme_params)
      if @theme.save
        render json: @theme
      else
        render json: {error: 'Error creating museum'}
      end
    end

    def show
      @theme = Theme.find(params[:id])
      render json: @theme
    end

    def destroy
      @theme = Theme.find(params[:id])
      @theme.destroy
    end

    def update
      @theme = Theme.find(params[:id])
      @theme.update(name: params["name"])
      @theme.save
      render json: @theme
    end

    private

    def theme_params
      params.require(:name).permit(:name)
    end


end