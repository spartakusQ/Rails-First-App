document.addEventListener('turbolinks:load', () => {
  const timerElement = document.querySelector('.timer')
  if (timerElement) {
    runTimer(timerElement)
  }
})

/**
 * runTimer
 * @param {HTMLElement} timerElement
 */
function runTimer (timerElement) {
  let seconds = timerElement.dataset.timeLeft

  if (seconds !== 'false') {
    seconds = parseInt(seconds, 10)
    const repeaterId = setInterval(() => {
      if (seconds === 0) {
        turnOffTimer(timerElement, repeaterId)
        document.forms[0].submit()
      } else {
        seconds--
      }

      timerElement.textContent = timeLeftToHhMmSs(seconds)
    }, 1000)
  } else {
    timerElement.classList.add('hide')
  }
}

function timeLeftToHhMmSs(seconds) {
  left_seconds = parseInt(seconds, 10)

  var hours = ~~(seconds / 3600)
  var minutes = ~~(seconds % 3600 / 60)
  var seconds = ~~(seconds % 3600 % 60)

  return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
}



/**
 * turnOffTimer
 * @param {HTMLElement} timerElement
 * @param {Object} repeaterId
 */

function foo (msg) {
    window.alert("Ваше время на выполнение теста вышло")
    window.location = 'http://localhost:3000/'
}

function turnOffTimer (timerElement, repeaterId) {
  clearInterval(repeaterId)
  timerElement.classList.remove('timer')
  timerElement.classList.add('ended')
  timerElement.classList.remove('unended')
}
