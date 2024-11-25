import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String, turboFrameId: String }

  fetchData(event) {
    const selectedId = event.target.value
    if (!selectedId) return

    const turboFrame = document.querySelector(`turbo-frame#${this.turboFrameIdValue}`)
    if (!turboFrame) return

    turboFrame.src = `${this.urlValue}/${selectedId}`
  }
}
