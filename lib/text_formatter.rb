class TextFormatter 

  def self.format_text(string, line_length_limit)
    tokens = self.tokenize(string)
    tokens = self.break_up_large_tokens(tokens, line_length_limit)
    tokens = self.word_wrap(tokens, line_length_limit)
    tokens = self.concatenate(tokens)
  end

  def self.concatenate(tokens)
    final_string = ""
    for i in 0...tokens.length do 
      tokens[i].split("").each do |char|
        final_string << char 
      end
      if i != tokens.length - 1
        if tokens[i] != "\n" && tokens[i + 1] != "\n"
          final_string << " "
        end
      end
    end
    return final_string
  end


  def self.tokenize(string)
    lines = []
    string.downcase.split("\n").map do |line| 
      line.split.each do |word|
        lines << word
      end
      lines << "\n"
    end
    lines[0...-1]
  end

  def self.word_wrap(tokens, line_length_limit)
    line_length = 0 
    wrapped_tokens = []
    self.break_up_large_tokens(tokens, line_length_limit).each do |token|
      line_length += token.length unless token == "\n"
      if line_length >= line_length_limit
        wrapped_tokens << "\n" 
        wrapped_tokens << token 
        line_length = token.length
      else
        wrapped_tokens << token 
      end
    end
    return wrapped_tokens
  end

  def self.break_up_large_tokens(tokens, line_length_limit)
    broken_up_tokens = []
    tokens.each do |token|
      if token.length > line_length_limit
        broken_up_tokens << token[0...line_length_limit]
        broken_up_tokens << token[line_length_limit..token.length]
      else  
        broken_up_tokens << token
      end
    end
    broken_up_tokens
  end
end