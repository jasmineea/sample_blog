class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :show, :destroy]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new 
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Post was saved!"
            redirect_to posts_path(@post)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            flash[:notice] = "Post was updated!"
        else
            flash[:notice] = "Post was not updated."
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @post.destroy
        flash[:notice] = "Post was deleted"
        redirect_to posts_path
    end


    private
    def post_params
        params.require(:post).permit(:name, :description)
    end

    def set_post
        @post = Post.find(params[:id])
     end
end
