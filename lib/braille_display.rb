require './lib/braille'

class BrailleDisplay 
  include Braille
    attr_reader :braille_data

  def initialize
    @text_formatter = TextFormatter.new(40)
    @braille_data = []
    @ascii_data = ""
  end 

  def write(message)
    @ascii_data << @text_formatter.format_text(message)
    self.clear
    @ascii_data.split("\n").each do |line|
      line_data = []
      line.split("").each do |char| 
        line_data.push(to_braille(char)).flatten
      end
      @braille_data.push(line_data).flatten
    end
    self
  end

  def clear
    @braille_data = []
  end

  def to_s 
    string = ""
    @braille_data.each do |line| 
      for i in 0..2 do 
        for j in 0..line.size - 1 do 
          string << line[j][i]
        end
        string << "\n"
      end
    end
    string
  end
  
end