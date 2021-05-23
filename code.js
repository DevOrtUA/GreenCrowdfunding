$("#formLogin").submit(function (e) {
    e.preventDefault();
    var username = $.trim($("#username").val());
    var password = $.trim($("#password").val());
    if (username.length == "" || password == "") {
        Swal.fire({
            type: 'warning',
            title: 'Please enter your username or password.',
        });
        return false;
    } else {
        $.ajax({
            url: "db/login.php",
            type: "POST",
            datatype: "json",
            data: {username:username, password:password},
            success: function (data) {
                if (data == "null") {
                    Swal.fire({
                        type: 'error',
                        title: 'Invalid username or password',
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'login successfully',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.location.href = "views/pag_init.php";
                            // window.location.href = "dashboard/index.php";
                        }
                    })

                }
            }
        });
    }
});