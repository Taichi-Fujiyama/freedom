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
  
  #カリキュラムを参照にしたが、以下の@postに代入したコードの内容、newとcreateの関係がイマイチよくわからない。
  def create
    @post = current_user.posts.new(topic_params)
     if @post.save 
       redirect_to home_path, success:"業務を追加しました。"
     else
       redirect_to new_post_path,danger:"業務を追加できませんでした。入力項目に不備があります。"
     end
  end
  
  private 
  def post_params
    params.require(:topic).permit(:title,:description,:work_hour,:due_date,:URL,:appointed_user_id)
  
  end
  
end
