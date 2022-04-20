import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {

  static targets = ["name", "message"]

  connect() {
    this.viewed = false
    const name = this.nameTarget.dataset.info
    const message = this.messageTarget.dataset.info
    console.log(this.targets);
    this.fire(name, message)
  }
  
  fire(name, message) {
    let icon
    if(!this.viewed && name && message){
      if(name === 'notice') {
        icon = 'success'
      } else {
        icon = 'warning'
      }
      Swal.fire(
        message,
        "",
        icon
      ).then(() => {
        this.nameTarget.dataset.info = ""
        this.messageTarget.dataset.info = ""
      })
    }
  }
}
