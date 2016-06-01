require 'spec_helper.rb'

describe 'ActiveCSV::Reader' do
  let(:base_class) { SoftGood }

  describe "camelcase" do
    it "should convert the base class name to camelcase" do
      expect(base_class.camelcase).to eq "soft_good"
    end
  end 

  describe "build" do
    it "should return an array" do
      expect(base_class.build).to be_kind_of(Array)
    end

    it "should throw an exception if no file found" do
      expect{ActiveCSV::Base.build}.to raise_error(Errno::ENOENT)
    end

    it "should return only instances of the base class" do
      expect(base_class.build.all?{|bc| bc.class == SoftGood } ).to be true
    end
  end
end