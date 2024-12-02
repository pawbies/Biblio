import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["search", "checkboxContainer", "checkbox"]

  filter() {
    const searchTerm = this.searchTarget.value.toLowerCase();

    let selectedCount = 0;

    this.checkboxTargets.forEach((checkbox) => {
      const label = checkbox.nextElementSibling.textContent.toLowerCase();

      if (checkbox.checked) {
        checkbox.parentElement.style.display = "";
        selectedCount++;
      } else if (searchTerm === "") {
        checkbox.parentElement.style.display = "none";
      } else if (label.includes(searchTerm)) {
        checkbox.parentElement.style.display = "";
      }  else {
        checkbox.parentElement.style.display = "none";
      }

    });

    if (searchTerm === "" && selectedCount === 0) {
      this.checkboxContainerTarget.style.display = "none";
    } else {
      this.checkboxContainerTarget.style.display = "";
    }
  }
}