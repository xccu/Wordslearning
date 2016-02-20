function setDropdownlist(source, target) {
    var list = document.getElementById(target);
    var svalue = $("#" + source).val();
    for (i = 0; i < list.options.length; i++) {
        if (svalue == list.options[i].value) {
            $("#" + target).find("option[value='" + svalue + "']").attr("selected", true);
            break;
        }
    }
}