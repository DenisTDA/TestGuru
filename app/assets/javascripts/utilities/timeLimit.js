document.addEventListener('turbolinks:load', function() {

  let progress = document.getElementById('time_left_prc').value
  let duration = document.getElementById('time_left').value
  let time_limit = document.getElementById('time_limit').value
  let time = duration
  const hrefResult = document.querySelector('form').action

  const countdownElem =  document.querySelector('.countdown')
  
  function updateCountdown() {
    let minutes = Math.floor(time / 60)
    let seconds = time % 60
    minutes = Math.round(minutes)
    seconds = Math.round(seconds)
    minutes = minutes < 10 ? '0' + minutes : minutes
    seconds = seconds < 10 ? '0' + seconds : seconds
    
    countdownElem.innerHTML = minutes + ':' + seconds
    time -= 0.1
  }

  function changeColor(progress){
    if (progress < 20) {
      document.querySelector('.progress-bar').classList.remove('bg-success')
      document.querySelector('.progress-bar').classList.add('bg-warning')
    }
    if (progress < 10) {
      document.querySelector('.progress-bar').classList.remove('bg-warning')
      document.querySelector('.progress-bar').classList.add('bg-danger')
    }
  }

  function updateProgressBar(){
    if(progress < 0) {
      progress = 100
      window.location.href = hrefResult + "/result"      
    } else {
      $('.progress-bar').css("width", progress + "%").text(Math.round(progress) + "%")
      progress = progress - (100/time_limit)*0.1
      changeColor(progress)
    }
  }

  setInterval( updateTimer, 100 )

  function updateTimer(){
    updateCountdown()
    updateProgressBar()
  }
})

