pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# jQuery dan dependencies utama (sesuaikan nama file asli!)
pin "jquery", to: "jquery-3.2.1.min.js"
pin "jquery-migrate", to: "jquery-migrate-3.0.1.min.js"
pin "popper", to: "popper.min.js"
pin "bootstrap", to: "bootstrap.min.js"

# Plugin jQuery
pin "jquery-easing", to: "jquery.easing.1.3.js"
pin "jquery-stellar", to: "jquery.stellar.min.js"
pin "jquery-waypoints", to: "jquery.waypoints.min.js"
pin "jquery-animate-number", to: "jquery.animateNumber.min.js"
pin "jquery-timepicker", to: "jquery.timepicker.min.js"
pin "jquery-magnific-popup", to: "jquery.magnific-popup.min.js"

# Bootstrap datepicker
pin "bootstrap-datepicker", to: "bootstrap-datepicker.js"

# Libraries lainnya
pin "aos", to: "aos.js"
pin "owl-carousel", to: "owl.carousel.min.js"
pin "scrollax", to: "scrollax.min.js"
pin "google-map", to: "google-map.js"
pin "range", to: "range.js"

# Main script
pin "main", to: "main.js"