class WikisController < ApplicationController

  def index
    if current_user.admin? || current_user.premium?
      @private_wikis = Wiki.where(private: true)
    end
      @collaborate_wikis = current_user.collaborate_wikis
      @public_wikis = Wiki.where(private: false)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    @users = User.all
  end

  def wiki
    @wikis = Wiki.where(private: true)
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Wiki was saved!!!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again. #{@wiki.errors.full_messages}"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @collaborators = @wiki.collaborate_users
    @users = User.all - @collaborators
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Post was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] =j "There was an error deleting the post."
      render :show
    end
  end

  def add_collaborator
    @wiki = Wiki.find(params[:id])
    @wiki.collaborate_users << User.find(params[:user_id])
    redirect_to :back
  end

  def remove_collaborator
    @wiki = Wiki.find(params[:id])
    @wiki.collaborate_users.delete(User.find(params[:user_id]))
    redirect_to :back
  end
end
