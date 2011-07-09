class ClubsController < ApplicationController

  before_filter :find_all_clubs
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @club in the line below:
    present(@page)
  end

  def show
    @club = Club.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @club in the line below:
    present(@page)
  end

protected

  def find_all_clubs
    @clubs = Club.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/clubs").first
  end

end
