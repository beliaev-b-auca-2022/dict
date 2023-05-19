defmodule Dictionary do
  defstruct words: %{}

  def run do
    dict = %Dictionary{}
    loop(dict)
  end

  defp loop(dict) do
    IO.puts("Dictionary Menu")
    IO.puts("1. Add Word")
    IO.puts("2. Get Translation")
    IO.puts("3. Exit")
    IO.puts("4. Matrix Multiplication")
    IO.puts("Enter your choice:")
    choice = String.trim(IO.gets(""))

    case choice do
      "1" ->
        word = String.trim(IO.gets("Enter the word: "))
        translation = String.trim(IO.gets("Enter the translation: "))
        dict = add_word(dict, word, translation)
        dict = add_word(dict, translation, word)
        loop(dict)
      "2" ->
        word = String.trim(IO.gets("Enter the word to translate: "))
        translation = get_translation(dict, word)
        case translation do
          nil -> IO.puts("Translation not found.")
          _ -> IO.puts("Translation: #{translation}")
        end
        loop(dict)
      "3" ->
        IO.puts("Exiting Dictionary.")
      _ ->
        IO.puts("Invalid choice. Please try again.")
        loop(dict)
    end
  end

  def add_word(dict, word, translation) do
    %{dict | words: Map.put(dict.words, word, translation)}
  end

  def get_translation(dict, word) do
    Map.get(dict.words, word)
  end
end
#
Dictionary.run()
