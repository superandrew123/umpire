module ViewHelper

  def resume_watch(game)
    if current_user && current_user.id == game.user_id
      link_to("Resume", game_path(game))
    else
      # this needs to go to a different path where no JS will be active
      # for clicks on the show page
      link_to("Watch", game_path(game))
    end
  end

end