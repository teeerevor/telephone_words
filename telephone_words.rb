class TelephoneWords
  @@letter_map = {
    "2"=> %w(A B C),
    "3"=> %w(D E F),
    "4"=> %w(G H I),
    "5"=> %w(J K L),
    "6"=> %w(M N O),
    "7"=> %w(P Q R S),
    "8"=> %w(T U V),
    "9"=> %w(W X Y Z)
  }

  def list_words(number_list)
    check_input(number_list)
    list = remove_junk_numbers(number_list)
    list = build_list(list)
    print_list(list)
  end

  def check_input(number_list)
    raise 'Needs an array as input, for example [2,5]' unless number_list.is_a?(Array)
    raise 'Input array cannot be empty. Use atleast one number [2]' unless number_list.size > 0
    raise 'Input array must contain numbers. For example[2]' unless number_list.all? {|i| i.is_a?(Integer) }
  end

  def remove_junk_numbers(number_list)
    number_list.reject! {|item| item < 2 || item > 9 }
    number_list
  end

  def build_list(number_list)
    if number_list.size > 1
      current_number = number_list.shift
      current_words_list = build_list(number_list)

      new_words_list = []
      @@letter_map[current_number.to_s].each do |letter|
        current_words_list.each do |word|
          new_words_list.push(letter + word)
        end
      end
      return new_words_list
    else
      return @@letter_map[number_list.first.to_s]
    end
  end

  def print_list(word_list)
    word_list.join(', ')
  end
end
