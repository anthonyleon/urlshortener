class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

        respond_to do |format|
          if @url.save
            format.html { redirect_to @url, notice: 'Url was successfully created.' }
            format.json { render :show, status: :created, location: @url }
          else
            format.html { render :new }
            format.json { render json: @url.errors, status: :unprocessable_entity }
          end
        end
  end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_url
        @url = Url.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def url
        params.require(:url).permit(:original_url)
      end

end
