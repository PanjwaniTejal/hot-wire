import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="make-as-read-unread"
export default class extends Controller {
  static values = { url: String, storyId: Number }

  connect() {
    console.log('Connected Read Unread')
  }

  read(e) {
    // Prevent anchor tag herf URL('/' as root_path) from being called on click
    e.preventDefault();
    e.stopImmediatePropagation();

    // Collect information from the anchor tag & use fetch to call API
    console.log('read function')
    
    let url = this.urlValue
    let story_id = this.storyIdValue

    fetch(`${url}`, {
      method: 'PATCH',
      contentType: 'application/json',
      hearders: 'application/json'
    })
    .then((response) => response.text())
    .then(res => {
      $(`#story_${story_id}`).html(res)
    })
  }

  unread(e){
    // Prevent anchor tag herf URL('/' as root_path) from being called on click
    e.preventDefault();
    e.stopImmediatePropagation();

    // Collect information from the anchor tag & use fetch to call API
    console.log('unread function')

    let url = this.urlValue
    let story_id = this.storyIdValue

    fetch(`${url}`, {
      method: 'PATCH',
      contentType: 'application/json',
      hearders: 'application/json'
    })
    .then((response) => response.text())
    .then(res => {
      $(`#story_${story_id}`).html(res)
    })
  }
}
