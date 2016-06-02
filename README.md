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


## Usage

To implement ActiveCSV you will need to add CSV file named the same format as you would a database to the data folder. In our example I used the name soft_goods.csv and brands.csv. This file should have a header row that mirrors the attributes you want to add to your class.

**soft_good.csv**
```csv
id,type,brand,description
8942,pants,mollitia,Consequatur nulla numquam voluptatem.
6373,hoodie,consequatur,Natus ut eius veniam ab eos.
8581,jacket,mollitia,Non voluptatibus odio tempore veritatis.
2800,gloves,maiores,Odio explicabo cum ipsa sit aliquid ut molestiae similique.
...
```

**brands.csv**
```csv
id,name,address
8294,mollitia,17210 Meghan Square
1949,consequatur,919 Ratke Viaduct
...
```

### Adding Base Attributes
By inheriting from ActiveCSV::Base all functionality will be added to your model. The first of which will be the ability to add attributes with the attr_acessor method. Each attribute should match the corrisponding CSV file header column. If there are extra columns in the CSV file that do not need imported, leave them out of the model attributes.

```ruby
class SoftGood < ActiveCSV::Base
  attr_accessor :id, :type, :brand, :description

end
```


### join
Implementing the join method in the model will link to CSV files together. It will add a method to the class that will allow for a one-to-many type relationship between to models. The join method needs a Class to link to and an attribute in the parent that it should join on. 

```ruby
class Brand < ActiveCSV::Base
  attr_accessor :id, :name, :address
  # Join SoftGood on the brand column, that references the Brand models attribute :name
  join( SoftGood, 'name' )
end

instance_of_brand.soft_goods
```



### all
The all command will read the CSV file and return a collection of model instances that mirror the CSV rows.

```ruby
SoftGood.all 
```

### where
The where command will search the models for all records that match the attribute, and query that is passed in.

```ruby
SoftGood.where(:type, 'gloves')
```

### group_by
The group_by command will return a collection of the uniq values that match the attribute requested. 

```ruby
SoftGood.group_by(:type)
```





