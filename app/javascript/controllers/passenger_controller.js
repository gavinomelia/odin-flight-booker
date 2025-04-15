import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["template", "container"];

  connect() {}

  addPassenger(event) {
    event.preventDefault();

    if (this.templateTarget.content) {
      const content = this.templateTarget.content.cloneNode(true);
      this.containerTarget.appendChild(content);
    } else {
      const content = this.templateTarget.cloneNode(true);
      content.removeAttribute("data-passenger-target");
      content.classList.remove("hidden");
      this.containerTarget.appendChild(content);
    }
  }

  removePassenger(event) {
    event.preventDefault();

    const passengerFields =
      this.containerTarget.querySelectorAll(".passenger-fields");
    if (passengerFields.length > 1) {
      const passengerElement = event.target.closest(".passenger-fields");
      if (passengerElement) {
        passengerElement.remove();
      }
    } else {
      alert("You must have at least one passenger.");
    }
  }
}
