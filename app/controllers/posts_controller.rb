class PostsController < ApplicationController
  def create
    @post = Post.new(
      user_id:@current_user.id
      )
  end
  
  def index
    #間に合わせの各業務ステータスの値
    @complete = 40
    @in_progress = 10
    @not_yet = 30
    # 以下は、円グラフの凡例を導入するためのコード
    sum = @complete + @in_progress + @not_yet
    @complete_per = sprintf("%.1f",@complete/sum.to_f * 100)
    @in_progress_per = sprintf("%.1f",@in_progress/sum.to_f * 100)
    @not_yet_per = sprintf("%.1f",@not_yet/sum.to_f * 100)
    
  end
end
