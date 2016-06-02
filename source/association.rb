module ActiveCSV
  module Association
    def join(joining_class, attribute_name)
      define_method "#{joining_class.camelcase}s" do
        joining_class.where(self.class.camelcase, self.send(attribute_name))
      end
    end
  end
end