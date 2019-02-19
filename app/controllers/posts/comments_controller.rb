module Posts
  class CommentsController < ApplicationController

    def destroy
      @comment = Comment.preload(:post,{post: :user}).find(params[:id])
      @post = @comment.post
      @user = @post.user
      if @comment.destroy
        flash[:success] = "コメントの削除が完了しました"
        redirect_to user_post_path(@user,@post)
      else
        flash[:warning] = "コメントの削除に失敗しました"
        redirect_to user_post_path(@user,@post)
      end
    end

    def create
      @post = Post.find(params[:post_id])
      @comments = @post.comments.build(comment_params)
      if @comments.save
        flash[:warning] = "コメントを作成しました"
        redirect_to @post
      else
        flash[:warning] = "コメントの作成に失敗しました"
        redirect_to @post
      end
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.preload(:post,{post: :user}).find(params[:id])
      @post = @comment.post
      @user = @post.user
      if @comment.update_attributes(comment_params)
        flash[:success] = "コメントを更新しました"
        redirect_to @post
      else
        flash.now[:warning] = "コメントの編集に失敗しました"
        render 'edit'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

  end
end