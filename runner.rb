require 'pry'
require './source/base.rb'
require './source/reader.rb'
require './soft_goods.rb'

all_goods = SoftGoods.all()

binding.pry

puts "end"