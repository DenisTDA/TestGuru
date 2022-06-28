document.addEventListener('turbolinks:load', function() {

  let progress = document.getElementById('time_left_prc')?.value
  let duration = document.getElementById('time_left')?.value
  let time_limit = document.getElementById('time_limit')?.value
  const hrefResult = document.querySelector('form')?.action + "/result"
  
  const countdownElem =  document.querySelector('.countdown')
  const progressBarElem = document.querySelector('.progress-bar')

  const countDown = new CountDown(countdownElem, duration)
  const progressBar = new TimeProgressBar(progressBarElem, time_limit, progress, hrefResult)

  function updateTimer(){
    countDown.updateCountdown()
    progressBar.updateProgressBar()
  }

  if (countdownElem && progressBarElem) {
    setInterval( updateTimer, 100 )
  }
})

