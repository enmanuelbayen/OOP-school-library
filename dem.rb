class A
  def initialize
    @a  = {'a': 'help'}
  end

  def self.help
    puts @a
  end
end

A.help()