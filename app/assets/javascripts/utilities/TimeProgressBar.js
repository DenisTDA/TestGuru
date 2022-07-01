class TimeProgressBar {
  constructor(elem, time_limit, time_left) {
    this.elem = elem
    this.time_limit = time_limit
    this.progress = time_left * 100 / time_limit
  }

  updateProgressBar(){
    if(this.progress < 0) {
      document.querySelector('.result').submit()
      this.progress = 100
    } else {
      this.elem.style.width = this.progress + "%"
      this.elem.textContent = Math.round(this.progress) + "%"
      this.progress = this.progress - (100 / this.time_limit) * 0.1
      this._changeColor(this.progress)
    }
  }

  _changeColor(progress){
    if (progress < 30) {
      this.elem.classList.remove('bg-success')
      this.elem.classList.add('bg-warning')
    }
    if (progress < 15) {
      this.elem.classList.remove('bg-warning')
      this.elem.classList.add('bg-danger')
    }
  }

}
