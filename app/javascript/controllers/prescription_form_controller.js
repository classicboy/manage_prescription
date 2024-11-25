import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton", "patientId"]

  connect() {
    this.updateSubmitState()
  }

  updateSubmitState() {
    const hasPatientId = this.patientIdTarget.value.trim() !== "";
    this.submitButtonTarget.disabled = !hasPatientId
  }

  handleFrameLoad() {
    this.updateSubmitState()
  }
}
