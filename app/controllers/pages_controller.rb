class PagesController < ApplicationController
  before_filter :nav_items

  def home
  end

  def about
  end

  def contact
  end

  def nav_items
    @nav_items = [[:root, "Home"], [:about_page, "About"], [:contact_page, "Contact"]]
  end
end
