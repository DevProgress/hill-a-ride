$ ->
  fb = new Facebook
  fb_selector = "#facebook-share-link"
  fb.bindShareButton(fb_selector, $(fb_selector).attr("data-url"))

  if $("body").hasClass("users-edit")
    new RegistrationPage()
  

class window.RegistrationPage

  constructor: () ->
    bind_registration_popup()

  bind_registration_popup = () ->
    $("#registration").click ->
      $("#registrationModal").modal('show')