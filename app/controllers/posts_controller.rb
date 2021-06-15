class PostsController < ApplicationController
  # def create
  #   @post = Post.new(
  #     user_id:@current_user.id
  #     )
  # end
  
  def index
    #間に合わせの各業務ステータスの値
    Post.group(:status).count
    
    @complete = Post.where(status:"1").count
    @in_progress = Post.where(status:"2").count
    @not_yet = Post.where(status:"3").count
    
    # 以下は、円グラフの凡例を導入するためのコード
    sum = @complete + @in_progress + @not_yet
    @complete_per = sprintf("%.1f",@complete/sum.to_f * 100)
    @in_progress_per = sprintf("%.1f",@in_progress/sum.to_f * 100)
    @not_yet_per = sprintf("%.1f",@not_yet/sum.to_f * 100)
    #追加した業務を一覧で表示するためのコード
    @posts = Post.all
    
  end
  
  #投稿の追加に関するコントローラーを設定する
  def new
    @post = Post.new
  end
  
  #投稿の追加ボタンが押された時のデータ受け渡しの処理
  def create
    @post = current_user.posts.new(post_params)
    # 上記の書き方は、省略した書き方となる。基本に従って書くと以下の様になる
    # @post = Post.new
    # @post.user_id = current_user.id
    # @post.title = post_params[:title]
    # @post.description = post_params[:description]
    # @post.work_hour = post_params[:work_hour]
    # @post.due_date = post_params[:due_date]
    # @post.URL = post_params[:URL]
    # @post.appointed_user_id = post_params[:appointed_user_id]
    
     if @post.save 
       redirect_to home_path, success:"業務を追加しました。"
     else
       flash.now[:danger] = "業務を追加できませんでした。タイトルと業務内容、優先度は必ず記入してください。"
       render :new 
     end
  end
  
  private 
  def post_params
    params.require(:post).permit(:title,:description,:work_hour,:due_date,:priority,:URL,:appointed_user_id)
  end
  
end
