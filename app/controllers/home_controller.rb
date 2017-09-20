class HomeController < ApplicationController
  def index
    @languages = Language.all.order('RANDOM()')
  end
end
