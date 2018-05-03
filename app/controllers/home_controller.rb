class HomeController < ApplicationController


  def home 
  	render :layout => 'landing'
  end

  def about
  	render :layout => 'about_page'
  end

end
