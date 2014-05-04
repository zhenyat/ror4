# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Sections
Section.create name: 'Section A'
Section.create name: 'Section B'
Section.create name: 'Section C'

# Categories
Category.create section_id: 1, name: 'Category A-X'
Category.create section_id: 1, name: 'Category A-Y'
Category.create section_id: 1, name: 'Category A-Z'
Category.create section_id: 2, name: 'Category B-X'
Category.create section_id: 2, name: 'Category B-Y'
Category.create section_id: 3, name: 'Category C-X'
Category.create section_id: 3, name: 'Category C-Y'
Category.create section_id: 3, name: 'Category C-Z'

# Products
Product.create category_id: 1, name: 'Product A-X-1', sku: 'A-X-01', price: 1100.00
Product.create category_id: 1, name: 'Product A-X-2', sku: 'A-X-02', price: 1200.99
Product.create category_id: 1, name: 'Product A-X-3', sku: 'A-X-03', price: 1300.33

Product.create category_id: 2, name: 'Product A-Y-1', sku: 'A-Y-01', price: 2100.00
Product.create category_id: 2, name: 'Product A-Y-2', sku: 'A-Y-02', price: 2200.99
Product.create category_id: 2, name: 'Product A-Y-3', sku: 'A-Y-03', price: 2300.33

Product.create category_id: 3, name: 'Product A-Z-1', sku: 'A-Z-01', price: 4100.00
Product.create category_id: 3, name: 'Product A-Z-2', sku: 'A-Z-02', price: 4200.99
Product.create category_id: 3, name: 'Product A-Z-3', sku: 'A-Z-03', price: 4300.33

Product.create category_id: 4, name: 'Product B-X-1', sku: 'B-X-01', price: 4100.00
Product.create category_id: 4, name: 'Product B-X-2', sku: 'B-X-02', price: 4200.99
Product.create category_id: 4, name: 'Product B-X-3', sku: 'B-X-03', price: 4300.33

Product.create category_id: 5, name: 'Product B-Y-1', sku: 'B-Y-01', price: 5100.00
Product.create category_id: 5, name: 'Product B-Y-2', sku: 'B-Y-02', price: 5200.99
Product.create category_id: 5, name: 'Product B-Y-3', sku: 'B-Y-03', price: 5300.33

Product.create category_id: 6, name: 'Product C-X-1', sku: 'C-X-01', price: 6100.00
Product.create category_id: 6, name: 'Product C-X-2', sku: 'C-X-02', price: 6200.99
Product.create category_id: 6, name: 'Product C-X-3', sku: 'C-X-03', price: 6300.33

Product.create category_id: 7, name: 'Product C-Y-1', sku: 'C-Y-01', price: 7100.00
Product.create category_id: 7, name: 'Product C-Y-2', sku: 'C-Y-20', price: 7200.99
Product.create category_id: 7, name: 'Product C-Y-3', sku: 'C-Y-03', price: 7300.33

Product.create category_id: 8, name: 'Product C-Z-1', sku: 'C-Z-01', price: 8100.00
Product.create category_id: 8, name: 'Product C-Z-2', sku: 'C-Z-02', price: 8200.99
Product.create category_id: 8, name: 'Product C-Z-3', sku: 'C-Z-03', price: 8300.99
