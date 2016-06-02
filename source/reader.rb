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
  end
end