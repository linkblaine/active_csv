module ActiveCSV
  module Aggregator
    def group_by(attribute)
      raise "Invalid Attribute #{attribute}" unless valid_attribute?(attribute)
      self.build.collect{|object| object.send(attribute)}.uniq
    end
  end
end