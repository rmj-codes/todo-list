// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Global Turbo error handler: reload page if expected turbo-frame is missing
addEventListener("turbo:frame-missing", function(event) {
//   window.location.reload();
});
