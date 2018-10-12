class HomeController < ApplicationController
  def index
    instances = Instance.all
    render "index.slang"
  end
end
