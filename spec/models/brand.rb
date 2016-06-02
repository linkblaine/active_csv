class Brand < ActiveCSV::Base
  attr_accessor :id, :name, :address
  join( SoftGood, 'name' )
  
end
