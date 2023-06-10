class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end
  

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path(@blog), notice: "blog has been created sucessfully!"
    else
      render :new
    end
  end
  
  
  def thumbs_up
    @blog = Blog.find(params[:id])
    @blog.increment!(:thumbs_up_count)
    redirect_to blog_path(@blog), notice: "Thumbs up given!"
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @comments = @blog.comments
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to blogs_path(@blog), notice: "blog has been deleted sucessfully!"
    else
      redirect_to blogs_path, alert: "Failed to delete"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :author)
  end
end
