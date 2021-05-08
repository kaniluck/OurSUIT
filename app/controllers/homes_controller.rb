class HomesController < ApplicationController

  def top
    @randams = Post.order("RANDOM()").limit(20)
  end

end
