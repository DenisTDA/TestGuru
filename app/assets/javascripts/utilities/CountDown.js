class CountDown {
  constructor(elem, time) {
    this.elem = elem
    this.time = time
  }

  updateCountdown() {
    let minutes = Math.floor(this.time / 60)
    let seconds = this.time % 60
    minutes = Math.round(minutes)
    seconds = Math.round(seconds)
    minutes = minutes < 10 ? '0' + minutes : minutes
    seconds = seconds < 10 ? '0' + seconds : seconds
    
    this.elem.innerHTML = minutes + ':' + seconds
    this.time -= 0.1
  }
}
