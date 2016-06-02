# Active CSV


## Description

This application is designed to act as an ORM CSV files. Users will be able to inhert a model from ARCSV::Base then interact with the CSV file as they would ActiveRecord.

## Demo

To see the functionality in action I've added two classes for a demo. 

**Brand.rb**
```ruby
class Brand < ActiveCSV::Base
  attr_accessor :id, :name, :address
  join( SoftGood, 'name' )
end
```
**SoftGood.rb**
```ruby
class SoftGood < ActiveCSV::Base
  attr_accessor :id, :type, :brand, :description

end
```

To see the demo code in action run `ruby demo.rb` in the terminal to see each of the methods in action.


