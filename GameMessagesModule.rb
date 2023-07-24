module GameMessages
  def greeting_msg
    puts msg = <<-TEXT
    --------------------------------
    ********************************
             Welcome to the
    Rock Paper Scissors Lizard Spock
                  Game
    ********************************
    --------------------------------

    Here are The Rules of The Game:
       • Rock crushes Scissors
       • Scissors cuts Paper
       • Paper covers Rock
       • Rock crushes Lizard
       • Lizard poisons Spock
       • Spock smashes Scissors
       • Scissors decapitates Lizard
       • Lizard eats Paper
       • Paper disproves Spock
       • Spock vaporizes Rock

    The winner will be chosen after 3 rounds.
    TEXT
  end

  def display_choices(player, frodo, bilbo, merry)
    puts msg = <<-TEXT
            You:        #{player.upcase}

            Frodo:      #{frodo.upcase}
            Bilbo:      #{bilbo.upcase}
            Merry:      #{merry.upcase}
    TEXT
  end

  def wrong_choice_msg
    puts msg = <<-TEXT
    Sorry! That's not a valid choice.
    Please make a vaild choice (rock paper scissors lizard spock):
    TEXT
  end

  def clear_screen
    system("clear") || system("cls")
  end

  def make_move_msg
    puts msg = <<-TEXT
    Please make a choice (rock paper scissors lizard spock):
    TEXT
  end
  def round_msg(player, frodo, bilbo, merry)
    puts "\n"
    puts "Player round: #{player}"
    puts "Frodo round:  #{frodo}"
    puts "Bilbo round:  #{bilbo}"
    puts "Merry round:  #{merry}"
  end

  def round_lost_msg(player, frodo, bilbo, merry)
    if frodo_win_player_round?(frodo, player)
      puts "\n"
      puts msg = <<-TEXT
            *------------------*
           *-  FRODO won YOU!  -*
           *-      * * *       -*
            *------------------*
      TEXT
      puts "\n"
    elsif bilbo_win_player_round?(bilbo, player)
      puts "\n"
      puts msg = <<-TEXT
            *------------------*
           *-  BILBO won YOU!  -*
           *-      * * *       -*
            *------------------*
      TEXT
      puts "\n"
    elsif merry_win_player_round?(merry, player)
      puts "\n"
      puts msg = <<-TEXT
            *------------------*
           *-  MERRY won YOU!  -*
           *-      * * *       -*
            *------------------*
      TEXT
      puts "\n"
    else
      puts "\n"
      puts msg = <<-TEXT
            *------------------*
           *-   YOU won this   -*
           *-      round!      -*
            *------------------*
      TEXT
      puts "\n"
    end
  end

  def round_tie_msg
    puts "\n"
    puts msg = <<-TEXT
            *------------------*
           *-  Round is a Tie. -*
           *- Let's try again. -*
            *------------------*
    TEXT
  end

  def score_display_msg(player, frodo, bilbo, merry)
    puts "\n"
    puts "Your Score:  #{player}"
    puts "Frodo Score: #{frodo}"
    puts "Bilbo Score: #{bilbo}"
    puts "Merry Score: #{merry}"
  end

  def game_win_msg(player, frodo, bilbo, merry)
    if frodo > player && frodo > bilbo && frodo > merry
      puts "\n"
      puts msg = <<-TEXT
           * * * * * * * * * * * * *
           *  FRODO WON THE GAME!  *
           * * * * * * * * * * * * *
    TEXT
    elsif bilbo > player && bilbo > frodo && bilbo > merry
      puts "\n"
      puts msg = <<-TEXT
           * * * * * * * * * * * * *
           *  BILBO WON THE GAME!  *
           * * * * * * * * * * * * *
    TEXT
    elsif merry > player && merry > frodo && merry > bilbo
      puts "\n"
      puts msg = <<-TEXT
           * * * * * * * * * * * * *
           *  MERRY WON THE GAME!  *
           * * * * * * * * * * * * *
    TEXT
    else
      player > frodo && player > bilbo && player > merry
      puts "\n"
      puts msg = <<-TEXT
           * * * * * * * * * * * * *
           *   YOU WON THE GAME!   *
           * * * * * * * * * * * * *
    TEXT
    end
  end

  def goodbye_msg
    puts "\n"
    puts "Thanks for played Rock Paper Scissors Lizard Spock! Goodbye!"
  end
end
