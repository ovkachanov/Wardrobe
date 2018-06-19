require_relative "thing"

class ThingCollection
  attr_reader :cupboard

  def initialize(path_for_data)
    @cupboard = get_from_dir(path_for_data)
  end

  def types_items
    @cupboard.map(&:type).uniq
  end

  def select_clothes_by_type(type)
    cupboard.select {|item| item.type == type}
  end

  def kit(generated_clothes)
    types = generated_clothes.map(&:type).uniq
    types.map { |type| generated_clothes.select {|item| item.type == type}.sample }
  end

  def generate(user_input)
    generated_clothes = @cupboard.select { |item| item if item.suitable_for_weather?(user_input) }
    kit(generated_clothes)
  end

  private

  def get_from_dir(path_for_data)
    if Dir.exist?(path_for_data)
      Dir[path_for_data + '/*.txt'].map {|file_path| Thing.new(file_path)}
    else
      raise "Ничего не найдено!"
    end
  end
end
