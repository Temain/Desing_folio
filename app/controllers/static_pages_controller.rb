class StaticPagesController < ApplicationController
  def index

  end

  def home
    respond_to do |format|
      format.js
    end
  end

  def work
    @my_data = 1
    respond_to do |format|
      format.js
    end
  end
end
