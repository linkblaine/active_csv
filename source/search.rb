module ActiveCSV
  module Search
    def where(attribute, value)
      raise "Invalid Attribute #{attribute}" unless valid_attribute?(attribute)
      self.build.select{ |object| object.send(attribute) == value.to_s }
    end

    private

    def valid_attribute?(attribute)
      self.attributes.any?{ |attrs| attrs.to_s == attribute }
    end
  end
end