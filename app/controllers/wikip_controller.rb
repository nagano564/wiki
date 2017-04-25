class WikipController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit, :create]
  def index
    @wikips = Wikip.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
