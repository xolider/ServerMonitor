const user = $('#user')
const pass = $('#pass')
const passConfirm = $('#passConfirm')

function check() {
    if(user.val() === '' || pass.val() === '' || passConfirm.val() !== pass.val()) {
        $('#secondnext').prop('disabled', true)
    }
    else {
        $('#secondnext').prop('disabled', false)
    }
}

user.keyup(check)
pass.keyup(check)
passConfirm.keyup(check)