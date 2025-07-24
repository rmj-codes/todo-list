# Todo List App

A simple, modern Todo List application built with Ruby on Rails 7, Tailwind CSS, Turbo, and Slim templates. The app is mobile-first and desktop-friendly, allowing you to manage tasks efficiently.

## Features

- Add, edit, and delete todo items
- Filter tasks by status (pending, in progress, completed)
- Responsive, mobile-first UI with Tailwind CSS
- Turbo-powered fast navigation
- Slim template engine for clean views

## Requirements

- Ruby 3.3.0 (see `.ruby-version`)
- Rails 7.2.2+
- PostgreSQL

## Setup Instructions

1. **Clone the repository**

   ```sh
   git clone <your-repo-url>
   cd todo_list
   ```

2. **Install dependencies**

   ```sh
   bundle install
   ```

3. **Setup the database**

   ```sh
   bin/rails db:create db:migrate db:seed
   ```

4. **Start the Rails server**

   ```sh
   bin/rails server
   ```

5. **Access the app**

   Open [http://localhost:3000](http://localhost:3000) in your browser.

## Running Tests

```sh
bin/rails test
```

System tests use Capybara and Selenium WebDriver.

## Project Structure

- `app/models/todo_item.rb` — Todo item model
- `app/controllers/todo_items_controller.rb` — Main controller
- `app/views/todo_items/` — Slim views for todo items
- `app/assets/stylesheets/` — Tailwind CSS
- `db/seeds.rb` — Sample seed data

## Deployment

- Standard Rails deployment (Heroku, Render, etc.)
- Ensure environment variables for PostgreSQL are set

## License

MIT
