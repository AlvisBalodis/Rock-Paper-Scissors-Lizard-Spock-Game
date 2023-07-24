require_relative "PlayerClass"
require_relative "FrodoClass"
require_relative "BilboClass"
require_relative "MerryClass"
require_relative "GameMessagesModule"


class Game
  attr_reader :player, :frodo, :bilbo, :merry
  include GameMessages

  def initialize
    player = Player.new
    @player = player
    bilbo = Bilbo.new(%i[rock paper scissors lizard spock])
    @bilbo = bilbo
    frodo = Frodo.new(%i[rock paper scissors lizard spock])
    @frodo = frodo
    merry = Merry.new(%i[rock paper scissors lizard spock])
    @merry = merry
  end

  def frodo_win_player_round?(frodo, player)
    WIN_RULES[frodo].include?(player)
  end

  def bilbo_win_player_round?(bilbo, player)
    WIN_RULES[bilbo].include?(player)
  end
  
  def merry_win_player_round?(merry, player)
    WIN_RULES[merry].include?(player)
  end
  
  def frodo_round_is_tie?(player, frodo)
    player == frodo
  end

  def bilbo_round_is_tie?(player, bilbo)
    player == bilbo
  end

  def merry_round_is_tie?(player, merry)
    player == merry
  end

  def player_win_game?(player, frodo, bilbo, merry)
    player > frodo && player > bilbo && player > merry
  end

  def game_is_over?(player, frodo, bilbo, merry)
     player > 3 && frodo > 3 && bilbo > 3 && merry > 3
  end

  WIN_RULES = {
    rock: %i[scissors lizard],
    paper: %i[rock spock],
    scissors: %i[paper lizard],
    lizard: %i[spock paper],
    spock: %i[scissors rock]
  }

  def play_game
    game = Game.new
    player_score = 0
    frodo_score = 0
    bilbo_score = 0
    merry_score = 0
    player_round = 1
    frodo_round = 1
    bilbo_round = 1
    merry_round = 1
    clear_screen
    game.greeting_msg
    loop do
      loop do
        game.round_msg(player_round, frodo_round, bilbo_round, merry_round)
        game.make_move_msg
        player_choice = player.move
        loop do
          break if player.valid_choice?(player_choice)
          game.wrong_choice_msg
          player_choice = player.move
        end
        puts frodo_choice = frodo.move
        puts bilbo_choice = bilbo.move
        puts merry_choice = merry.move
        game.clear_screen
        game.display_choices(player_choice, frodo_choice, bilbo_choice, merry_choice)

        if frodo_round_is_tie?(player_choice, frodo_choice)
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)
          game.round_tie_msg

        elsif bilbo_round_is_tie?(player_choice, bilbo_choice)
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)
          game.round_tie_msg

        elsif merry_round_is_tie?(player_choice, merry_choice)
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)
          game.round_tie_msg
           
        elsif frodo_win_player_round?(frodo_choice, player_choice)
          game.round_lost_msg(player_choice,frodo_choice, bilbo_choice, merry_choice)
          frodo_score += 1
          player_round += 1
          frodo_round += 1
          bilbo_round += 1
          merry_round += 1
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)
  
        elsif bilbo_win_player_round?(bilbo_choice, player_choice)
          game.round_lost_msg(player_choice, frodo_choice, bilbo_choice, merry_choice)
          bilbo_score += 1
          player_round += 1
          frodo_round += 1
          bilbo_round += 1
          merry_round += 1
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)
          
        elsif merry_win_player_round?(merry_choice, player_choice)
          game.round_lost_msg(player_choice, frodo_choice, bilbo_choice, merry_choice)
          merry_score += 1
          player_round += 1
          frodo_round += 1
          bilbo_round += 1
          merry_round += 1
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)

        else
          player_score += 1
          player_round += 1
          frodo_round += 1
          bilbo_round += 1
          merry_round += 1
          game.round_lost_msg(player_choice, frodo_choice, bilbo_choice, merry_choice)
          game.score_display_msg(player_score, frodo_score, bilbo_score, merry_score)
        end
        break if game_is_over?(player_round, frodo_round, bilbo_round, merry_round)
      end
      if player_win_game?(player_score, frodo_score, bilbo_score, merry_score)
        game.game_win_msg(player_score, frodo_score, bilbo_score, merry_score)
        break
      else
        game.game_win_msg(player_score, frodo_score, bilbo_score, merry_score)
        break
      end
    end
    game.goodbye_msg
    exit
  end
end

competition = Game.new
competition.play_game
