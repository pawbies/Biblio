import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fields", "checkbox"];

  toggle() {
    const fields = this.fieldsTarget;
    if (this.checkboxTarget.checked) {
      fields.classList.remove("hidden");
    } else {
      fields.classList.add("hidden");
    }
  }
}
