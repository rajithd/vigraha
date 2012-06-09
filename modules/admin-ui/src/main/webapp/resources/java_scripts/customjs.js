function datePickAlertNeutralize() {
    document.getElementById("dateAlert").style.visibility = "hidden";
}

$(function() {
    $("#datepicker1").datepicker({showOtherMonths: true, selectOtherMonths: true});
    $("#datepicker1").datepicker("option", "dateFormat", "yy-mm-dd");
});


$(function() {
    $("#datepicker2").datepicker({showOtherMonths: true, selectOtherMonths: true});
    $("#datepicker2").datepicker("option", "dateFormat", "yy-mm-dd");
});



