import swal from 'sweetalert';

function bindSweetAlertDelete() {
  const swalButton = document.getElementById('sweet-alert-delete');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Are you sure?",
        text: "Do you really want to delete this?",
        icon: "success"
      });
    });
  }
}

export { bindSweetAlertDelete };
