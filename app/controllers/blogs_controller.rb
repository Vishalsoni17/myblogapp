class BlogsController < ApplicationController
  def index
 @user=User.find(params[:user_id])
@blogs= @user.blogs

  end

  def new
    @user =User.find(params[:user_id])
    @blog=Blog.new
end

def create
    @user = User.find(params[:user_id])
  @blog = @user.blogs.new(blog_params)



  respond_to do |format|
    if @blog.save
      format.html { redirect_to user_blogs_path(@user)}# ,notice: "Blog was successfully created." }
      format.json { render :show, status: :created, location: @blog }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
end
end
def update
  @user = User.find(params[:user_id])
  @blog=Blog.find(params[:id])

  respond_to do |format|
    if @blog.update(blog_params)
      format.html { redirect_to user_blogs_path(@user), notice: "User was successfully updated." }
      format.json { render :show, status: :ok, location: @blog }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
  end
end

def destroy

  @user = User.find(params[:user_id])
  @blog=Blog.find(params[:id])

  @blog.destroy

  respond_to do |format|
    format.html { redirect_to user_blogs_path(@user), notice: "blog was successfully destroyed." }
    format.json { head :no_content }
  end
end


def show
   @user =User.find(params[:user_id])
   @blog=@user.blogs.find(params[:id])
end

def edit 
  @user =User.find(params[:user_id])
  @blog=@user.blogs.find(params[:id])

end
private 

def blog_params
  params.require(:blog).permit(:title ,:description )
  
end
end
