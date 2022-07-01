document.addEventListener('turbolinks:load', function() {

  let time_left = document.getElementById('time_left')?.value
  let time_limit = document.getElementById('time_limit')?.value
  
  const countdownElem =  document.querySelector('.countdown')
  const progressBarElem = document.querySelector('.progress-bar')

  const countDown = new CountDown(countdownElem, time_left)
  const progressBar = new TimeProgressBar(progressBarElem, time_limit, time_left)

  function updateTimer() {
    countDown.updateCountdown()
    progressBar.updateProgressBar()
  }

  if (countdownElem && progressBarElem ) {
    let timerId = setInterval( updateTimer, 100 )
  }
})
