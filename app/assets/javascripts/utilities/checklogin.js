document.addEventListener('turbolinks:load', function() {
  const form = document.getElementById('new_guru')  
  if(form) {new CheckPasswordConfirm(form)}  
})
