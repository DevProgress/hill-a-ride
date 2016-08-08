$ ->

  if $("body").hasClass("events-show")
    new EventPage()
  
class window.EventPage
  constructor: () ->
    bind_request_seat_popup()

  bind_request_seat_popup = () ->

    $("#request-seat-modal").click ->
      $("#requestSeatModal").modal('show')