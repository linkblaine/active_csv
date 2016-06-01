module ActiveCSV
  module Reader
    def build
      filename = "data/#{camelcase}s.csv"
      objects = []
      CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
        objects << self.new(row)
      end

      return objects
    end

    def camelcase
      self.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
    end
  end
end