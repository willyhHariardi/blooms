module Backyard
  class HomeController < ApplicationController
    before_action :authenticate_admin!

    layout 'backyard/application'
    
    def index
    end
  end
end
