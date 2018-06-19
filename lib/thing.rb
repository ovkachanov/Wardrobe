require_relative "thing_collection"

class Thing
  attr_reader :name_thing, :type, :min_temp, :max_temp

  def initialize(file_path)
    raise "Файл #{file_path} содержит мало строк." if File.readlines(file_path).size < 3

    lines = File.readlines(file_path).map(&:chomp)
    range = lines[2].delete(',').split

    @name_thing = lines[0]
    @type = lines[1]
    @min_temp = range[0].to_i
    @max_temp = range[1].to_i
  end

  def suitable_for_weather?(user_input)
    user_input.between?(@min_temp, @max_temp)
  end

  def to_s
    "#{self.name_thing} (#{self.type}) #{self.min_temp}..#{self.max_temp}"
  end
end
