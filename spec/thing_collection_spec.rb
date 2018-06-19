require_relative '../lib/thing'
require_relative '../lib/thing_collection'

describe Thing do
  let(:count_good_items) {Dir[path_for_good_data + '/*.txt'].count}
  let(:path_for_good_data) {"#{__dir__}/fixtures/good_data"}
  let(:path_for_bad_data) {"#{__dir__}/fixtures/bad_data"}
  let(:wardrobe) {ThingCollection.new(path_for_good_data)}

  describe '#initialize' do
    it 'create wardrobe' do
      expect(wardrobe.cupboard.count).to eq count_good_items
    end

    it 'call raise RuntimeError' do
      expect {ThingCollection.new(path_for_bad_data)}.to raise_error(RuntimeError)
    end

    it 'wardrobe is an array of clothes' do
      expect(wardrobe.cupboard).to be_an(Array)
    end

    it 'objects in an array of class Thing' do
      expect(wardrobe.cupboard[1].class).to eq Thing
    end
  end

  describe '#types_items' do
    it 'select 2 type items for good data' do
      expect(wardrobe.types_items).to match_array(['Обувь', 'Головной убор', 'Одежда'])
    end
  end

  describe '#select_clothes_by_type' do
    it 'select array of 2 items by type' do
      expect(wardrobe.select_clothes_by_type('Головной убор').count).to eq 2
    end

    it 'select array of 1 item by type' do
      expect(wardrobe.select_clothes_by_type('Обувь').count).to eq 1
    end

    it 'select empty array of items by type' do
      expect(wardrobe.select_clothes_by_type('Шарф').count).to eq 0
    end
  end

  describe '#generate' do
    it 'get array of 3 clothes by temperetute' do
      expect(wardrobe.generate(25).count).to eq 3
    end

    it 'get empty array clothes by temperetute' do
      expect(wardrobe.generate(-50).count).to eq 0
    end
  end
end
