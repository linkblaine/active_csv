require 'spec_helper.rb'

describe 'ActiveCSV::Reader' do
  let(:base_class) { SoftGood }
  let(:types) { %w[pants hoodie jacket gloves t-shirt] }

  describe 'group_by' do
    it 'should return only one occurence of each value' do
      expect( SoftGood.group_by(:type) ).to eq types
    end

    it 'should throw an expection if in invalid attribute is passed' do
      expect{ SoftGood.group_by(:foo) }.to raise_error(RuntimeError)
    end
  end
end
