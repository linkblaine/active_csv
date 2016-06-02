require 'csv'
require './source/reader.rb'
require './source/search.rb'
require './source/aggregator.rb'
require './source/association.rb'

module ActiveCSV
  class Base
    extend ActiveCSV::Reader
    extend ActiveCSV::Search
    extend ActiveCSV::Aggregator
    extend ActiveCSV::Association

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

    def self.valid_attribute?(attribute)
      self.attributes.any?{ |attrs| attrs.to_s == attribute.to_s }
    end

    private 

    def self.camelcase
      self.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end

    def self.attributes
      @attributes
    end

    def attributes
      self.class.attributes
    end
  end
end