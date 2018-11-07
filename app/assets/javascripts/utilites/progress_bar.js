document.addEventListener('turbolinks:load', function() {
  var progressBarIndicator = document.querySelector('.progress-bar')

  if (progressBarIndicator) { setProgress(progressBarIndicator) }
})

function setProgress(progressBarIndicator) {
  var currentQuestionNumber = progressBarIndicator.dataset.currentQuestionNumber
  var questionsCount = progressBarIndicator.dataset.questionsCount

  var completionPercent = ((currentQuestionNumber - 1) / questionsCount) * 100

  progressBarIndicator.style.width = completionPercent + "%"
}
