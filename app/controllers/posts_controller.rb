class PostsController < ApplicationController
  # def create
  #   @post = Post.new(
  #     user_id:@current_user.id
  #     )
  # end
  
  def index
    #間に合わせの各業務ステータスの値
    Post.group(:status).count
    
    #以下のコードは、当初Post.where(status:"1",appointed_user_id: current_user.id).countとしていた。これでは、担当者の各ステータスが取得できないでので、appointed_user_idに修正
    @complete = Post.where(status:"1",appointed_user_id: current_user.id).count
    @in_progress = Post.where(status:"2",appointed_user_id: current_user.id).count
    @not_yet = Post.where(status:"3",appointed_user_id: current_user.id).count
    
    
    # 以下は、円グラフの凡例を導入するためのコード
    sum = @complete + @in_progress + @not_yet
    if sum == 0
       @complete_per = sprintf("%.1f",0)
       @in_progress_per = sprintf("%.1f",0)
       @not_yet_per = sprintf("%.1f",0)
    else 
      @complete_per = sprintf("%.1f",@complete/sum.to_f * 100)
      @in_progress_per = sprintf("%.1f",@in_progress/sum.to_f * 100)
      @not_yet_per = sprintf("%.1f",@not_yet/sum.to_f * 100)
    end
    
    @posts = Post.where(appointed_user_id: current_user.id)
    #上記コードは、当初where(user_id: current_user.id)としていた。しかし、これだとuser_idの値つまり、ログイン中のユーザーhomeに業務が追加されてしまうので、修正した。
    #追加した業務をユーザ別に一覧で表示するためのコード。Post.allとすると、全てのユーザーの　post内容が表示されてしまう。
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
       flash.now[:danger] = "業務を追加できませんでした。タイトルと業務内容、優先度、担当者は必ず記入してください。"
       render :new 
     end
  end
  
  private 
  def post_params
    params.require(:post).permit(:title,:description,:work_hour,:due_date,:priority,:URL,:appointed_user_id)
  end
  
end
