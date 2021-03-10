class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}

  def top
  end

  def about_login
  end

  def about_registration
  end

  def information
  end

  def nav
  end

end
