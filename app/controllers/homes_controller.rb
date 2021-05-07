class HomesController < ApplicationController

  def top
    @posts = Post.all
    @randams = Post.order("RANDOM()").limit(5)
  end

end
