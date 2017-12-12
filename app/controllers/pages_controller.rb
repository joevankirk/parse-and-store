class PagesController < ApplicationController
  def home
  end

  def new
    @page = Page.new
  end

  def list
  end
end
