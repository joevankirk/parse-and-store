class PagesController < ApplicationController
  before_action :set_page, only:[:index, :create]

  def home
  end

  def new
    @page = Page.new
  end

  def list
  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end
end
