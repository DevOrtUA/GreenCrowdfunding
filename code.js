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
            url: "../db/login.php",
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
                            window.location.href = "../views/pag_init.php";
                        }
                    })

                }
            }
        });
    }
});

$("#formLoginDonatore").submit(function (e) {
    e.preventDefault();
    var email = $.trim($("#email").val());
    var password = $.trim($("#password").val());
    if (email.length == "" || password == "") {
        Swal.fire({
            type: 'warning',
            title: 'Please enter your username or password.',
        });
        return false;
    } else {
        $.ajax({
            url: "../db/login_donatore.php",
            type: "POST",
            datatype: "json",
            data: {email:email, password:password},
            success: function (data) {
                if (data == "null") {
                    Swal.fire({
                        type: 'error',
                        title: 'Invalid email or password',
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'login successfully',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.location.href = "../index.html";
                            // window.location.href = "dashboard/index.php";
                        }
                    })

                }
            }
        });
    }
});

$("#formRegistrazione").submit(function (e) {
    e.preventDefault();
    var nome = $.trim($("#nome").val());
    var cognome = $.trim($("#cognome").val());
    var stato = $.trim($("#stato").val());
    var datanascita = $.trim($("#datanascita").val());
    var email = $.trim($("#email").val());
    var telefono = $.trim($("#telefono").val());
    var codicefiscale = $.trim($("#codicefiscale").val());
    var password = $.trim($("#password").val());

    if (email.length == "" || password == "") {
        Swal.fire({
            type: 'warning',
            title: 'Please enter your email or password.',
        });
        return false;
    } else {
        $.ajax({
            url: "../db/registrazionedonatore.php",
            type: "POST",
            datatype: "json",
            data: {
                nome:nome,
                cognome:cognome,
                stato:stato,
                datanascita:datanascita,
                email:email,
                telefono:telefono,
                codicefiscale:codicefiscale,
                password:password,
            },
            success: function (data) {
                console.log(data) ;
                if (data === "Donatore già Registrato") {
                    Swal.fire({
                        type: 'error',
                        title: data,
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'Donatore Registrato',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.location.href = "login_donatore.php";
                        }
                    })

                }
            }
        });
    }
});

$("#formRegistrazioneOrganizzazione").submit(function (e) {
    e.preventDefault();
    var nomeorganizzazione = $.trim($("#nomeorganizzazione").val());
    var descrizione = $.trim($("#descrizione").val());
    var email = $.trim($("#email").val());
    var telefono = $.trim($("#telefono").val());
    var partitaiva = $.trim($("#partitaiva").val());

    if (email.length == "" || partitaiva.length == "") {
        Swal.fire({
            type: 'warning',
            title: 'Please enter email or partitaiva.',
        });
        return false;
    } else {
        $.ajax({
            url: "../db/registrazioneorganizzazione.php",
            type: "POST",
            datatype: "json",
            data: {
                nomeorganizzazione:nomeorganizzazione,
                descrizione:descrizione,
                email:email,
                telefono:telefono,
                partitaiva:partitaiva,
            },
            success: function (data) {
                console.log(data) ;
                if (data === "Organizzazione già Registrata") {
                    Swal.fire({
                        type: 'error',
                        title: data,
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'Organizzazione Registrata',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.location.href = "views/pag_init.php";
                        }
                    })

                }
            }
        });
    }
});

$("#formCreazioneProgetto").submit(function (e) {
    e.preventDefault();
    var titolo = $.trim($("#titolo").val());
    var descrizione = $.trim($("#descrizione").val());
    var categoria = $.trim($("#categoria").val());
    var datascadenza = $.trim($("#datascadenza").val());
    var proposto = $.trim($("#proposto").val());
    var importofinanziamento = $.trim($("#importofinanziamento").val());
    var immagine = $.trim($("#immagine").val());

    if (categoria.length == "" || datascadenza.length == "") {
        Swal.fire({
            type: 'warning',
            title: 'Please enter categoria or datascadenza.',
        });
        return false;
    } else {
        $.ajax({
            url: "../db/creazioneprogetto.php",
            type: "POST",
            datatype: "json",
            data: {
                titolo:titolo,
                descrizione:descrizione,
                categoria:categoria,
                datascadenza:datascadenza,
                importofinanziamento:importofinanziamento,
                proposto:proposto,
                immagine:immagine,
            },
            success: function (data) {
                console.log(data) ;
                if (data === "Progetto già Creato") {
                    Swal.fire({
                        type: 'error',
                        title: data,
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'Progetto Creato',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.close()
                        }
                    })

                }
            }
        });
    }
});

$("#formDonazione").submit(function (e) {
    e.preventDefault();
    var iddonatore = $.trim($("#iddonatore").val());
    var codprogetto = $.trim($("#idprogetto").val());
    var tipopagamento = $.trim($("#tipopagamento").val());
    var importo = $.trim($("#importo").val());
    if (importo.length === "") {
        Swal.fire({
            type: 'warning',
            title: 'Please enter a importo.',
        });
        return false;
    } else {
        $.ajax({
            url: "../db/donazione.php",
            type: "POST",
            datatype: "json",
            data: {
                iddonatore:iddonatore,
                codprogetto:codprogetto,
                tipopagamento:tipopagamento,
                importo:importo,
            },
            success: function (data) {
                if (data == "null") {
                    Swal.fire({
                        type: 'error',
                        title: 'Invalid username or password',
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'La donazione è andata a buon fine',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.close()
                        }
                    })

                }
            }
        });
    }
});

$("#formEliminazioneProgettoAdmin").submit(function (e) {
    e.preventDefault();
    var codprogetto = $.trim($("#idprogettoeliminazione").val());
    if (codprogetto.length === "") {
        Swal.fire({
            type: 'warning',
            title: 'Codice Progetto non esiste.',
        });
        return false;
    } else {
        $.ajax({
            url: "../db/eliminazioneprogetto.php",
            type: "POST",
            datatype: "json",
            data: {
                codprogetto:codprogetto,
            },
            success: function (data) {
                if (data == "null") {
                    Swal.fire({
                        type: 'error',
                        title: 'Progetto non esiste'
                    });
                } else {
                    Swal.fire({
                        type: 'success',
                        title: 'Eliminazione progetto è andata a buon fine',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Confirm'
                    }).then((result) => {
                        if (result.value) {
                            window.close()
                        }
                    })
                }
            }
        });
    }

});
