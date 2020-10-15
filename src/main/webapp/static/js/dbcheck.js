const dbhost = $('#dbhost')
const dbport = $('#dbport')
const dbname = $('#dbname')
const dbuser = $('#dbuser')
const dbpass = $('#dbpass')

function check() {
    if(dbhost.val() === '' || dbport.val() === '' || dbname.val() === ''
        || dbuser.val() === '' || dbpass.val() === '') {
        $('#firstnext').prop('disabled', true)
    }
    else {
        $('#firstnext').prop('disabled', false)
    }
}

dbhost.keyup(check)
dbport.keyup(check)
dbname.keyup(check)
dbuser.keyup(check)
dbpass.keyup(check)