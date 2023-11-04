pin "@hotwired/turbo-rails", to: "turbo.js"
pin "@hotwired/stimulus", to: "stimulus.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "application", to: "application.js", preload: true