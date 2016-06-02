require 'spec_helper.rb'

describe 'ActiveCSV::Reader' do
  let( :brand_with_goods ) { Brand.where(:name, 'mollitia').first }
  let( :brand_without_goods ) { Brand.new(id: 0, name: 'foo', address: 'bar') }

  describe 'join' do 
    it 'should return all child classes with matching name' do 
      expect( brand_with_goods.soft_goods.length ).to be 6
    end

    it 'should return no results if no child classes match' do
      expect( brand_without_goods.soft_goods.length).to be 0
    end
  end
end
