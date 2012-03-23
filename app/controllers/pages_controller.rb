class PagesController < ApplicationController
  before_filter :nav_items
  before_filter :setup_negative_captcha, :only => [:contact, :make_contact]

  def home
  end

  def about
  end

  def contact
  end

  def nav_items
    @nav_items = [[:root, "Home"], [:about_pages, "About"], [:contact_pages, "Contact"]]
  end

  def make_contact
    if @captcha.valid? && ContactMailer.contact_email(@captcha.values[:name], @captcha.values[:email], @captcha.values[:message]).deliver
      redirect_to :root
    else
      redirect_to :make_contact_pages
    end
  end

  private

    def setup_negative_captcha
      @captcha = NegativeCaptcha.new(
        :secret => NEGATIVE_CAPTCHA_SECRET,
        :spinner => request.remote_ip,
        :fields => [:name, :email, :message],
        :params => params)
      pie = 3
    end


end
