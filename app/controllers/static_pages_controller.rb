class StaticPagesController < ApplicationController
  def index

  end

  def home
    respond_to do |format|
      format.js
    end
  end

  def work
    respond_to do |format|
      format.js
    end
  end
end
