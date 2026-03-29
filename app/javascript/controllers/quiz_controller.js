import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { answer: String }
  static targets = ["option", "result", "description", "nextButton"]

  check(event) {
    const selected = event.currentTarget.dataset.option
    const isCorrect = selected === this.answerValue

    this.#revealAnswer(event.currentTarget, isCorrect)
    this.#showResult(isCorrect)

    this.descriptionTarget.classList.remove("d-none")
    this.nextButtonTarget.classList.remove("d-none")
  }

  #revealAnswer(clickedButton, isCorrect) {
    this.optionTargets.forEach((button) => {
      button.disabled = true
      button.classList.remove("btn-outline-primary")
      button.classList.add(this.#resultClassFor(button, clickedButton, isCorrect))
    })
  }

  #resultClassFor(button, clickedButton, isCorrect) {
    if (button.dataset.option === this.answerValue) return "btn-success"
    if (button === clickedButton && !isCorrect) return "btn-danger"
    return "btn-outline-secondary"
  }

  #showResult(isCorrect) {
    this.resultTarget.classList.remove("d-none")
    this.resultTarget.innerHTML = isCorrect
      ? '<div class="alert alert-success">正解！</div>'
      : `<div class="alert alert-danger">不正解… 正解は <strong>${this.answerValue}</strong> です</div>`
  }
}
