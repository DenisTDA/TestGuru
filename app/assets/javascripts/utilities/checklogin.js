document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.check-password')
  if (control) { control.addEventListener('input', checkConfirmPasswordFild) }
})

function checkConfirmPasswordFild() {
  var form = document.querySelector('form')
  var fieldsInput = form.querySelectorAll('input')

  var textPassword = getValueInput(fieldsInput,'user_password')
  var textConfirmPassword = getValueInput(fieldsInput,'user_password_confirmation')

  
  if (textConfirmPassword === '') {
    if (!document.querySelector('.octicon-shield-check').classList.contains('hide')) { 
      document.querySelector('.octicon-shield-check').classList.add('hide')
    }
    if (!document.querySelector('.octicon-shield-x').classList.contains('hide')) { 
      document.querySelector('.octicon-shield-x').classList.add('hide')
    }
  } else if (textConfirmPassword !== textPassword) {
    document.querySelector('.octicon-shield-check').classList.add('hide')
    document.querySelector('.octicon-shield-x').classList.remove('hide')
  } else {
    document.querySelector('.octicon-shield-check').classList.remove('hide')
    document.querySelector('.octicon-shield-x').classList.add('hide')
  }
}

function getValueInput(fields, id = '') {
  for (var i =0; i < fields.length; i++) {
    if (fields[i].id === id) {
      return fields[i].value
    }
  }
}
