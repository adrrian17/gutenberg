firstDate = (new Date(2013, 6, 10) - new Date()) / 1000

var clock = $('.flipclock').FlipClock(firstDate,{
	clockFace: 'DailyCounter',
	countdown: true
});