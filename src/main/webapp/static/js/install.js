$('.progress').hide()

let i = 0

function fire() {
    i++
    if(i === 3) {
        window.location = $('#serverURL').text().replaceAll("URL: ", "")
    }
}

function setupSystem() {
    $('li:eq(2)').addClass('bg-success text-light')
    fire()
}

function fillDB() {
    $('li:eq(1)').addClass('bg-primary text-light')
    $.ajax({
        type: 'GET',
        url: $('#serverURL').text().replaceAll("URL: ", "") + "/filldb",
        success: (data) => {
            if(data.state === 'success') {
                $('li:eq(1)').removeClass('bg-primary')
                $('li:eq(1)').addClass('bg-success')
                setupSystem()
                fire()
            }
        }
    })
}

function installDB() {
    $('li:eq(0)').addClass('bg-primary text-light')
    $.ajax({
        type: 'GET',
        url: $('#serverURL').text().replaceAll("URL: ", "") + "/installdb",
        success: (data) => {
            if(data.state === 'success') {
                $('li:eq(0)').removeClass('bg-primary')
                $('li:eq(0)').addClass('bg-success')
                fillDB()
                fire()
            }
        },
        error: (data, status, er) => {
            console.log(data + status + er)
        }
    })
}

$('#install').click(() => {
    $('#install').prop('disabled', true)
    $('.progress').show()
    installDB()
})