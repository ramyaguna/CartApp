import { Controller } from "@hotwired/stimulus"

export default class extends ProductController {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
