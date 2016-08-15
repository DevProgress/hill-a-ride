$ ->

  if $("body").hasClass("events-show")
    new EventPage()

  if $("body").hasClass("events-index")
    new EventListPage()
  
class window.EventPage
  constructor: () ->
    bind_request_seat_popup()

  bind_request_seat_popup = () ->

    $("#request-seat-modal").click ->
      $("#requestSeatModal").modal('show')


class window.EventListPage

  constructor: () ->
    bind_date_picker()

  bind_date_picker = () ->
    $('input[name="start_date"]').daterangepicker {
      'singleDatePicker': true
      'startDate': this.value
      'endDate': '11/30/2016'
    }, (start, end, label) ->
      window.location.replace("events?date=" + start.format('YYYY-MM-DD'));
      return