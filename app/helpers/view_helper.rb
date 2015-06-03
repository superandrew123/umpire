module ViewHelper

  def continue(game)
    if current_user && current_user.id == game.user_id
      # div that shows resume and delete
      ('<div class="myGame"><div class="resumeButton">'+ link_to("Resume", game_path(game)) +'</div><div class="deleteGame"> Delete </div></div>').html_safe
    else
      # div that shows watch only
      ('<div class="watchButton">'+ link_to("Watch", game_path(game)) +'</div>').html_safe
    end
  end

end