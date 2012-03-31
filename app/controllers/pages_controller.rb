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
    if @captcha.valid? && form_valid && send_message
      redirect_to :root
    else
      redirect_to :contact_pages, :flash => { :error => @failure_reason }
    end
  end

  private

    def setup_negative_captcha
      @captcha = NegativeCaptcha.new(
        :secret => NEGATIVE_CAPTCHA_SECRET,
        :spinner => request.remote_ip,
        :fields => [:name, :email, :message],
        :params => params)
    end

    def form_valid
      email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

      if @captcha.values[:name].blank? || @captcha.values[:email].blank? || @captcha.values[:message].blank?
        @failure_reason = "All fields are requried!"
        return false
      end

      unless @captcha.values[:email] =~ email_regex
        @failure_reason = "Valid email addresses only!"
        return false
      end

      return true
    end

    def send_message
      return ContactMailer.contact_email(@captcha.values[:name], @captcha.values[:email], @captcha.values[:message]).deliver
    end

end
