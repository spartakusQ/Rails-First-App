document.addEventListener('turbolinks:load', function() {
  var password_field = document.getElementById('user_password')
  var password_field_confirmation = document.getElementById('user_password_confirmation')

  if (password_field && password_field_confirmation) {
    password_field.addEventListener('input', checkPasswordField)
    password_field_confirmation.addEventListener('input', checkPasswordFieldConfirmation)
  }
})

function checkPasswordField() {
  if (!this.value) { iconHide() }
}

function checkPasswordFieldConfirmation() {
  var password_field = document.getElementById('user_password')

  if (password_field.value) {
    (this.value == password_field.value) ? iconSuccess() : iconDanger()
  }

  if (!this.value) { iconHide() }
}

function iconSuccess() {
  document.querySelector('.octicon-verified').classList.remove('hide')
  document.querySelector('.octicon-verified').classList.remove('text-danger')
  document.querySelector('.octicon-verified').classList.add('text-success')
}

function iconDanger() {
  document.querySelector('.octicon-verified').classList.remove('hide')
  document.querySelector('.octicon-verified').classList.remove('text-success')
  document.querySelector('.octicon-verified').classList.add('text-danger')
}

function iconHide() {
  document.querySelector('.octicon-verified').classList.remove('text-success')
  document.querySelector('.octicon-verified').classList.remove('text-danger')
  document.querySelector('.octicon-verified').classList.add('hide')
}
