# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
static_pages = ["about", "employees", "scientific_activity", "contacts", "for_applicants", "for_students", "for_teachers", "postgraduate_school", "library", "time_table"]

static_pages.each do |permalink|
  Page.create(
    published: true,
    title: permalink,
    text: "<a href=\"/admin/pages\">Edit me</a>",
    permalink: permalink
  )
end