import { Controller } from "@hotwired/stimulus"
import confetti from 'libraries/canvas-confetti'

export default class extends Controller {
  connect() {
    confetti();
    this.element.textContent = "Hello World From StimulusController!"
  }
}
