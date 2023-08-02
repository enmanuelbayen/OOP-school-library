require 'json'

class Save
  def initialize
    @format = {
      indent: '  ',
      array_nl: "\n",
      object_nl: "\n",
      space_before: '',
      space: ' '
    }
  end

  def to_json(data, filename)
    File.open(filename, 'w') do |file|
      file.write(JSON.generate(data, @format))
    end
  end
end
