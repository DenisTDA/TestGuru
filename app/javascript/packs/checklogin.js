//import { CheckPasswordConfirm } from './CheckPasswordConfirm.js'

document.addEventListener('turbolinks:load', function() {
  const form = document.getElementById('new_user')  
  if(form) {new CheckPasswordConfirm(form)}  
})
