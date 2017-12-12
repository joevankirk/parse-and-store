class PagesController < ApplicationController
  require 'open-uri'

  def index
    @pages = Page.all
  end

  def new
    puts Dir.pwd
    @page = Page.new

  end

  def create
    @page = Page.new(page_params)

    if @page
      parse(@page.url)
      @page = Page.create(h1: @h1, h2: @h2, h3: @h3, links: @links, url: @page.url)
      redirect_to list_path
    else
      render :new
    end
  end

  def parse(url)
    html_file = open(url).read
    doc = Nokogiri::HTML(html_file)
    @h1 = doc.css('h1').map(&:text).join(", ")
    @h2 = doc.css('h2').map(&:text).join(", ")
    @h3 = doc.css('h3').map(&:text).join(", ")
    @links = doc.css('a').map{ |link| link['href'] }.join(", ")

  end

  private

  def page_params
    params.require(:page).permit(:url)
  end
end
