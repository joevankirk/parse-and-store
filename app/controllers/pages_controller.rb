class PagesController < ApplicationController
  before_action :set_page, only:[:index, :create]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to links_path
    else
      render :new
    end
  end

  def parse

  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end

  def page_params
    params.require(:page).permit(:url)
  end
end
