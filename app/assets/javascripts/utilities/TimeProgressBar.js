class TimeProgressBar {
  constructor(elem, time_limit, progress, href) {
    this.elem = elem
    this.time_limit = time_limit
    this.progress = progress
    this.href = href
  }

  updateProgressBar(){
    if(this.progress < 0) {
      this.progress = 100
      window.location.href = this.href
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
