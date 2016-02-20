    var status = $("#status").val();
    if (status == "t") {
        $("#success").css({ "display": "block" });
    }
    if (status == "f") {
        $("#failed").css({ "display": "block" });
    }