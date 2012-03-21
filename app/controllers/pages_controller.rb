class PagesController < ApplicationController
  def home
    @current_page = 'home'
  end

  def portfolio
    @current_page = 'portfolio'
  end

  def about
    @current_page = 'about'
  end

  def contact
    @current_page = 'contact'
  end
end
