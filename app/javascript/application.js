// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  const flashMessage = document.getElementById("flash-message");
  if (flashMessage) {
    setTimeout(() => {
      flashMessage.style.transition = "opacity 0.5s ease";
      flashMessage.style.opacity = "0";
      setTimeout(() => flashMessage.remove(), 500);
    }, 2000); // 2秒後に消える
  }
});

