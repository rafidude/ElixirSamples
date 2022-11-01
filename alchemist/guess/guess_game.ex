defmodule GuessingGame do
  def welcome() do
    answer = :rand.uniform(100)
    IO.puts "Debug: #{answer}"
    IO.puts "Guessing Game:"
    IO.puts("The number I guessed is between 1 and 100")
    IO.puts("Your job is to guess the number")
    IO.puts("I will provide a hint guess higher or guess lower")
    get_user_input(answer)
  end

  def get_user_input(answer) do
    guess_str = IO.gets "Your guess: "
    guess_str = String.trim(guess_str)
    {guess, ""} = Integer.parse(guess_str)
    result = high_low_won(guess, answer)
    IO.puts "Guess: #{guess}, Answer: #{answer}, Result: #{result}"
    case result do
      :won ->
        IO.puts "You won!"
      :high ->
        IO.puts "Guess lower"
        get_user_input(answer)
      :low ->
        IO.puts "Guess higher"
        get_user_input(answer)
    end
  end

  def high_low_won(guess, answer) when guess == answer, do: :won

  def high_low_won(guess, answer) when guess > answer, do: :high

  def high_low_won(guess, answer) when guess < answer, do: :low

end
