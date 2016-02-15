class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    redirect_to "#{@url.original_url}"
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
      respond_to do |format|
        if @url.save
          format.html { redirect_to urls_path , notice: 'Url was successfully created.' }
        else
          format.html { render :new }
        end
      end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to urls_path, notice: 'Url was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_path, notice: 'Url was successfully destroyed.' }
    end
  end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_url
        @url = Url.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def url_params
        params.require(:url).permit(:original_url, :id)
      end

end
