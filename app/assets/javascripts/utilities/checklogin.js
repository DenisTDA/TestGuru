class CheckPasswordConfirm {
  constructor(form){
    this.form = form
    this.password = form.elements.user_password
    this.password_confirmation = form.elements.user_password_confirmation

    this.verify()
  }

  verify(){
    this.form.addEventListener('input', event => {
      this.checkConfirmPasswordFild() 
    })
  }

  checkConfirmPasswordFild() {
    let text1 = this.password.value
    let text2 = this.password_confirmation.value
    
    if (text1 === '' || text2 === '') {
      if (!this.form.querySelector('.octicon-shield-check').classList.contains('hide')) { 
        this.form.querySelector('.octicon-shield-check').classList.add('hide')
      }
      if (!this.form.querySelector('.octicon-shield-x').classList.contains('hide')) { 
        this.form.querySelector('.octicon-shield-x').classList.add('hide')
      }
    } else if (text1 !== text2) {
      this.form.querySelector('.octicon-shield-check').classList.add('hide')
      this.form.querySelector('.octicon-shield-x').classList.remove('hide')
    } else {
      this.form.querySelector('.octicon-shield-check').classList.remove('hide')
      this.form.querySelector('.octicon-shield-x').classList.add('hide')
    }
  }
}

document.addEventListener('turbolinks:load', function() {
  const form = document.getElementById('new_user')  
  if(form) {new CheckPasswordConfirm(form)}  
})
