import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sweetalert"
export default class extends Controller {

  connect() {
    // console.log(this.nameTarget.value)
    // console.log(this.messageTarget.value)
    // console.log(this.targets)
    this.redirect = false
  }
  
  showAlert(event) {
    if (this.redirect) return;

    event.stopImmediatePropagation();
    event.preventDefault();

    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          icon: 'success',
          title: 'Your profile has been deleted.',
          showConfirmButton: false,
          timer: 1500
        }).then(() => {
          this.redirect = true
          this.element.click();
        })
      }
    })
  }

}
