require_relative '../lib/thing'

describe Thing do
  let(:good_thing) { Thing.new("#{__dir__}/fixtures/good_data/1.txt") }

  describe "#initialize" do
    let(:bad_file_with_path) { "#{__dir__}/fixtures/bad_data/1.txt" }

    it "should initialize item" do
      expect(good_thing.name_thing).to eq "Шлепанцы"
      expect(good_thing.type).to eq "Обувь"
      expect(good_thing.min_temp).to eq +20
      expect(good_thing.max_temp).to eq +40
    end

    it "call raise becaise file has only a few lines" do
      expect {Thing.new(bad_file_with_path)}.to raise_error("Файл #{bad_file_with_path} содержит мало строк.")
    end
  end

  describe '#suitable_for_weather?' do
    it 'return true if user_input +25' do
      expect(good_thing.suitable_for_weather?(+25)).to be_truthy
    end

    it 'return false if user_input +10' do
      expect(good_thing.suitable_for_weather?(+10)).to be_falsey
    end
  end

  describe '#to_s' do
    it 'Show info' do
      expect(good_thing.to_s).to eq "Шлепанцы (Обувь) 20..40"
    end
  end
end
