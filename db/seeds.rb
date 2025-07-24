# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Seed initial todo items for the Todo List app

TodoItem.destroy_all

TodoItem.create!([
  {
    title: "Buy groceries",
    description: "Milk, Bread, Eggs, Cheese, and Vegetables",
    status: :pending
  },
  {
    title: "Finish Rails project",
    description: "Complete the mobile-first views and polish the README.",
    status: :in_progress
  },
  {
    title: "Read a book",
    description: "Read at least 30 pages of a novel.",
    status: :completed
  },
  {
    title: "Exercise",
    description: "Go for a 30-minute walk or do a workout.",
    status: :pending
  }
])

puts "Seeded #{TodoItem.count} todo items."
