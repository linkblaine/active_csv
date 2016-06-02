require 'spec_helper.rb'

describe 'ActiveCSV::Search' do
  let(:base_class) { SoftGood }
  
  describe "where" do
    it "should return an empty array if no records found" do
      expect(base_class.where("id", -1)).to eq []
    end

    it "should return a single object if one exists" do
      expect(base_class.where("id", 6371).length).to eq 1
    end

    it "should return the correct record if one exists" do
      expect(base_class.where("id", 6371).first.id).to eq "6371"
    end

    it "should return all objects that match" do 
      expect(base_class.where("type", "pants").length).to eq 5
    end

    it "should throw an exception if in invalid attribute is requested" do
      expect{base_class.where("foo", "pants")}.to raise_error(RuntimeError)
    end    
  end
end