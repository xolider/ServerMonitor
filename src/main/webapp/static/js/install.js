$('.progress').hide()

let i = 0

function fire() {
    i++
    if(i === 1) {
        window.location = $('#serverURL').text().replaceAll("URL: ", "")
    }
}

$('#install').click(() => {
    $('#install').prop('disabled', true)
    $('.progress').show()
    $.ajax({
        type: 'GET',
        url: $('#serverURL').text().replaceAll("URL: ", "") + "/installdb",
        success: (data) => {
            if(data.state === 'success') {
                $('li:eq(0)').addClass('bg-success text-light')
                fire()
            }
        },
        error: (data, status, er) => {
            console.log(data + status + er)
        }
    })
})