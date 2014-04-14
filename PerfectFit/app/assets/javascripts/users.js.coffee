# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Line
    element: 'calories_chart'
    data: $('#calories_chart').data('calories')
    xkey: 'date'
    ykeys: ['calories']
    labels: ['Calories']
    postUnits: ' Cal'

 
 jQuery ->
  Morris.Line
    element: 'weight_chart'
    data: $('#weight_chart').data('weight')
    goals: [$('#weight_chart').data('target')]
    goalStrokeWidth: 2
    goalLineColors: ['Orange']
    xkey: 'date'
    ykeys: ['weight']
    labels: ['weight']
    postUnits: ' lbs'