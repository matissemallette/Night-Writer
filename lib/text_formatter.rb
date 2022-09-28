require './lib/braille'

class TextFormatter 
  include Braille

  def initialize(line_limit)
    @ascii_line_length_limit = line_limit
  end

  def format_text(string)
    legal_string = self.legalize_string(string)
    tokens = self.tokenize(legal_string)
    tokens = self.break_up_large_tokens(tokens)
    tokens = self.word_wrap(tokens)
    concatenated_string = self.concatenate(tokens)
  end

  def legalize_string(string) 
    new_string = ""
    string.split("").each do |char| 
      if legal_character?(char) 
        new_string << char
      end
    end
    new_string
  end


  def concatenate(tokens) 
    final_string = ""
    i = 0 
    while i < tokens.length - 1 
      final_string << tokens[i].to_s
      if tokens[i].to_s == "\n"
        i += 1
      elsif tokens[i + 1].to_s == "\n"
        final_string << "\n"
        i += 2
      else
        final_string << " "
        i += 1
      end
    end
    final_string << tokens.last
  end


  def tokenize(string)
    lines = []
    string.downcase.split("\n").map do |line| 
      line.split.each do |word|
        lines << word
      end
      lines << "\n"
    end
    lines[0...-1]
  end

  def word_wrap(tokens)
    line_length = 0 
    wrapped_tokens = []
    self.break_up_large_tokens(tokens).each do |token|
      line_length += token.length unless token == "\n"
      if line_length >= @ascii_line_length_limit
        wrapped_tokens << "\n" 
        wrapped_tokens << token 
        line_length = token.length
      else
        wrapped_tokens << token 
      end
    end
    return wrapped_tokens
  end

  def break_up_large_tokens(tokens)
    broken_up_tokens = []
    tokens.each do |token|
      if token.length > @ascii_line_length_limit
        broken_up_tokens << token[0...@ascii_line_length_limit]
        broken_up_tokens << token[@ascii_line_length_limit..token.length]
      else  
        broken_up_tokens << token
      end
    end
    broken_up_tokens
  end
end