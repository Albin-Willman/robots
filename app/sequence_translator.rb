class SequenceTranslator
  COMMANDS = {
    'f' =>  :forward!,
    'b' =>  :backup!,
    'l' =>  :turn_left!,
    'r' =>  :turn_right!
  }.freeze

  def self.call(sequence)
    sequence.split(//).map{ |char| COMMANDS[char] }.compact
  end
end
