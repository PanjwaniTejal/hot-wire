import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["params"]

  search() {
    const value = this.paramsTarget.value

    fetch(`/search?search=${value}`, {
      contentType: 'application/json',
      hearders: 'application/json'
    })
    .then((response) => response.text())
    .then(res => {
      $('#stories').html(res)
    })
  }
}
