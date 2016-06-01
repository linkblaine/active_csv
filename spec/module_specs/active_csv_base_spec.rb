require 'spec_helper.rb'

describe 'ActiveCSV::Base' do
  let(:params)    { {id: 0, type: 'foo', brand: 'bar', description: 'bazz'} }
  let(:soft_good) { SoftGood.new(params) }
  let(:empty_good) { SoftGood.new() }

  describe "initialize" do
    it "should initialize id properly" do
      expect(soft_good.id).to eq 0
    end 

    it "should initialize type properly" do
      expect(soft_good.type).to eq 'foo'
    end 

    it "should initialize brand properly" do
      expect(soft_good.brand).to eq 'bar'
    end 

    it "should initialize description properly" do
      expect(soft_good.description).to eq 'bazz'
    end 

    it "should default values to nil if not in params" do
      expect(empty_good.id).to eq nil
    end
  end

  describe "all" do
    it "should return an array" do
      expect(SoftGood.all).to be_kind_of(Array)
    end

    it "should return all of the objects in the file" do
      expect(SoftGood.all.length).to eq 20
    end

    it "should only return instances of the base class" do
      expect(SoftGood.all.all?{|bc| bc.class == SoftGood } ).to be true
    end
  end
end