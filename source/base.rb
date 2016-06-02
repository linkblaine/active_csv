require 'csv'
require './source/reader.rb'
require './source/search.rb'

module ActiveCSV
  class Base
    extend ActiveCSV::Reader
    extend ActiveCSV::Search

    def initialize(args={})
      self.class.attributes.each do |attr|
        self.send("#{attr.to_s}=", args.fetch(attr, nil))
      end
    end

    def self.attr_accessor(*args)
      @attributes ||= []
      @attributes.concat args
      super(*args)
    end

    def self.all 
      self.build
    end

    private 

    def self.attributes
      @attributes
    end

    def attributes
      self.class.attributes
    end

  end
end