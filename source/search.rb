module ActiveCSV
  module Search
    def where(attribute, value)
      objects = self.build
      objects.select{ |object| object.send(attribute) == value.to_s }  
    end
  end
end