// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/javascript/application.js

// jQuery dan dependencies utama
import "jquery"
import "jquery-migrate"
import "popper"
import "bootstrap"

// Plugin jQuery
import "jquery-easing"
import "jquery-stellar"
import "jquery-waypoints"
import "jquery-animate-number"
import "jquery-timepicker"
import "jquery-magnific-popup"

// Bootstrap datepicker
import "bootstrap-datepicker"

// Libraries lainnya
import "aos"
import "owl-carousel"
import "scrollax"
import "google-map"
import "range"

// Main script (paling akhir)
import "main"

document.addEventListener('DOMContentLoaded', function() {
  const menuToggle = document.getElementById('menuToggle');
  const sidebar = document.getElementById('sidebar');
  const overlay = document.getElementById('overlay');
  const userDropdownToggle = document.getElementById('userDropdownToggle');
  const userDropdownMenu = document.getElementById('userDropdownMenu');

  // Toggle sidebar
  menuToggle.addEventListener('click', function() {
    sidebar.classList.toggle('active');
    overlay.classList.toggle('active');
  });

  // Close sidebar when clicking on overlay
  overlay.addEventListener('click', function() {
    sidebar.classList.remove('active');
    overlay.classList.remove('active');
  });

  // Toggle user dropdown
  userDropdownToggle.addEventListener('click', function(e) {
    e.stopPropagation();
    userDropdownMenu.classList.toggle('show');
    userDropdownToggle.classList.toggle('active');
  });

  // Close dropdown when clicking outside
  document.addEventListener('click', function(e) {
    if (!userDropdownToggle.contains(e.target) && !userDropdownMenu.contains(e.target)) {
      userDropdownMenu.classList.remove('show');
      userDropdownToggle.classList.remove('active');
    }
  });

  // Close sidebar on window resize (if in desktop mode)
  window.addEventListener('resize', function() {
    if (window.innerWidth >= 1024) {
      overlay.classList.remove('active');
    } else {
      if (sidebar.classList.contains('active')) {
        overlay.classList.add('active');
      }
    }
  });
});
