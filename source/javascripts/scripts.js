// = require vendor/modernizr
// = require jquery/dist/jquery

/* global $:true, _ */

$ = window.$

var cetlEvents = (function () {
  'use strict'

  function init () {
    var eventList = []

    $('.event').each(function () {
      var startDate = new Date($(this).data('start-date'))
      var endDate = new Date($(this).data('end-date'))
      var today = new Date()

      console.log('startDate', startDate);

      console.log('endDate', startDate >= today);

      console.log('today', endDate >= today);


      if ((startDate >= today) || (endDate >= today)) {
        eventList.push({
          'start_date': startDate,
          'body': $(this).html()
        })
      }
    })

    var sortedEvents = _.sortBy(eventList, 'start_date')
    var eventsHtml = _.map(sortedEvents, 'body').join('') || 'Il n’y a pas d’évènements à venir.'
    $('.events').html(eventsHtml)
  }

  return {
    init: init
  }
}())

$(document).ready(function () {
  cetlEvents.init()
})
