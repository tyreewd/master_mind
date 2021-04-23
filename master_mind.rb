class MasterMind
    attr_accessor :colors, :computer_code

    def initialize
        @colors = ["red", "blue", "green", "yellow", "purple", "orange"]
        @computer_code = []
        @right_color_position = 0
        @right_color_wrong_position = 0
        @guess = ""
    end
    

    def generate_code
        4.times do
            @computer_code << @colors.sample
        end
        @computer_code
    end

    def user_guess  
        puts "" 
        puts "Break the code! Select four guesses from " +
            "any comination of red, blue, green, yellow, purple, orange."
        puts ""   
        puts ""
        @guess = gets.chomp.split  
    end

    def the_actual_game
        @turns = 12 
        @code = choose_role
        the_spacer
        
        
        while @right_color_position < 4 && @turns > 0
            user_guess
            i = 0
            if @guess[i] == "cheat"
                p @code
            end
            @right_color_position = 0
            @right_color_wrong_position = 0
            4.times do
                if @guess[i] == @code[i]
                    @right_color_position += 1
                elsif @code.any?(@guess[i])
                    @right_color_wrong_position += 1
                end
                i += 1
            end
            @turns -= 1
            puts ""
            puts ""
            puts "There are #{@right_color_position} in the right spot and right color" +
             " and #{@right_color_wrong_position} in the wrong spot but right color." +
              " with #{@turns} turns left" if @right_color_position != 4
        end
        if @right_color_position == 4
            puts ""
            puts "Congratulations! The code was #{@code}."
        else
            puts "You lose. The code was #{@code}."
        end
    end

    def choose_role
        puts "Would you like to make the code this round? y/n"
        @player_role = gets.chomp.downcase
        return generate_code if @player_role == "n"   
        return choose_code if @player_role == "y" 
    end

    def choose_code
        puts ""
        puts "Please choose 4 of any combination of red, blue, green," +
                " yellow, purple, orange. Seperated by spaces."
        @player_code = gets.chomp.split
   
    end 

    def computer_guess

    end

    

    def play_game
        the_actual_game 
    end

    #This is necessary for two human players to hide the initial code from
    #the command line
    def the_spacer 
        50.times do
         puts ""
        end
       
    end
end

my_game = MasterMind.new()
my_game.play_game
