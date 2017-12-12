class PagesController < ApplicationController
  before_action :set_page, only:[:index, :create]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create

  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end
end
