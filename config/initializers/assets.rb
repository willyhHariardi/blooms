# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

Rails.application.config.assets.precompile += %w(
  application.js
  jquery.min.js
  popper.min.js
  bootstrap.min.js
  jquery.easing.1.3.js
  jquery.waypoints.min.js
  jquery.stellar.min.js
  owl.carousel.min.js
  jquery.magnific-popup.min.js
  aos.js
  jquery.animateNumber.min.js
  bootstrap-datepicker.js
  jquery.timepicker.min.js
  scrollax.min.js
  google-map.js
  main.js
)
