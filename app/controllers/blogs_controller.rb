class BlogsController < ApplicationController

before_action :authenticate_user,{only: [:new, :create]}

def index
  @articles = Article.page(params[:page]).per(10)
  end
end
