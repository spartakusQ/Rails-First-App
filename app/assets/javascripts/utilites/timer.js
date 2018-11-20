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
        alert("Ваше время на выполнение теста вышло.")
        window.location.replace(window.location + '/result')
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
  var seconds = ~~(seconds % 3600 % 60) + " time left"

  return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
}

/**
 * turnOffTimer
 * @param {HTMLElement} timerElement
 * @param {Object} repeaterId
 */


function turnOffTimer (timerElement, repeaterId) {
  clearInterval(repeaterId)
  timerElement.classList.remove('timer')
  timerElement.classList.add('ended')
  timerElement.classList.remove('unended')
}
