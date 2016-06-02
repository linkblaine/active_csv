require 'pry'
require './source/base.rb'
require './source/reader.rb'
require './soft_good.rb'
require './brand.rb'

all_brands = Brand.all

p "------------------"
p "Brand.all"
p "------------------"
all_brands.each{|brand| p brand }

puts 

p "------------------"
all_soft_goods = SoftGood.all
p "SoftGood.all"
p "------------------"
all_soft_goods.each{|good| p good }

puts

p "------------------"
gloves = SoftGood.where(:type, 'gloves')
p "SoftGood.where(:type,'gloves') "
p "------------------"
gloves.each{|good| p good }

puts 

p "------------------"
all_types_of_soft_goods = SoftGood.group_by(:type)
p "SoftGood.group_by(:type)"
p "------------------"
all_types_of_soft_goods.each{|good| p good }

puts 

p "------------------"
p "Brand.where(:name, 'maiores').first"
p "brand_instance.soft_goods"
p "------------------"
brand_instance = Brand.where(:name, 'maiores').first
p brand_instance
brand_instance.soft_goods.each{|good| p good }
