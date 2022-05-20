document.addEventListener('turbolinks:load', function(){
  if (document.querySelector(".progressbar")) { 
    const barBox = document.querySelector(".progressbar")
    let percent = (barBox.textContent).slice(0, -1)

    moveBar(percent, barBox)
  }

  function moveBar(percent, element) {
    element.style.width = percent
  }

})

