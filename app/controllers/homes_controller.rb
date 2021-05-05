class HomesController < ApplicationController

  def top
    @posts = Post.all
    @randams = Post.order("RAND()").limit(10)
  end

end
