module ActiveCSV
  module Search
    def where(attribute, value)
      self.build.select{ |object| object.send(attribute) == value.to_s }
    end
  end
end