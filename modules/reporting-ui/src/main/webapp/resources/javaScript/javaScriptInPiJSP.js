//var monthCheckBox = new Array("chkJanuary",
//        "chkFebruary",
//        "chkMarch",
//        "chkApril",
//        "chkMay",
//        "chkJune",
//        "chkJuly",
//        "chkAugust",
//        "chkSeptember",
//        "chkOctober",
//        "chkNovember",
//        "chkDecember");

function yearDataValidation(current_form) {
//    if (current_form["chkAllYears"].checked) {
//        current_form["yearly_rp_year_selection_value"].value = 3;
//    } else {
//        current_form["yearly_rp_year_selection_value"].value = current_form["years"].options[current_form["years"].selectedIndex].value;
//    }
//    current_form["yearly_rp_display_chart"].value = current_form["chkShowChart"].checked;
//    return true;
}

function monthDataValidation(current_form) {
    var yearsSelector = current_form["years"];
    var year = yearsSelector.options[yearsSelector.selectedIndex].value;
    var monthsSelector = current_form["months"];
    var months = "";
    for (var i=0; i<monthsSelector.options.length; i++) {
        if (monthsSelector.options[i].selected) {
          months += monthsSelector.options[i].value + ", ";
        }
    }
    current_form["monthly_rp_year"].value = year;
    current_form["monthly_rp_months"].value = months;
    current_form["monthly_rp_display_chart"] = current_form["chkShowChart"].checked;
    return true;
}

function noMonthSelected(current_form) {
//    for (var i = 0; i < 12; i++) {
//        if (current_form[monthCheckBox[i]].checked) {
//            return false;
//        }
//    }
//    return true;
}

function setValuesToMonthReportVariables(current_form) {
//    var monthVariables = new Array("monthly_rp_month_january",
//            "monthly_rp_month_february",
//            "monthly_rp_month_march",
//            "monthly_rp_month_april",
//            "monthly_rp_month_may",
//            "monthly_rp_month_june",
//            "monthly_rp_month_july",
//            "monthly_rp_month_august",
//            "monthly_rp_month_september",
//            "monthly_rp_month_october",
//            "monthly_rp_month_november",
//            "monthly_rp_month_december");
//    if (current_form["year"][0].checked) {
//        current_form["monthly_rp_year_selection_value"].value = 1;
//    } else if (current_form["year"][1].checked) {
//        current_form["monthly_rp_year_selection_value"].value = 2;
//    }
//    current_form["monthly_rp_display_chart"].value = current_form["chkShowChart"].checked;
//    for (var i = 0; i < 12; i++) {
//        current_form[monthVariables[i]].value = current_form[monthCheckBox[i]].checked;
//    }
}

function allMonthSelection(current_form) {
//    if (current_form["chkAllTheMonths"].checked) {
//        for (var i = 0; i < 12; i++) {
//            current_form[monthCheckBox[i]].checked = true;
//        }
//    } else {
//        for (i = 0; i < 12; i++) {
//            current_form[monthCheckBox[i]].checked = false;
//        }
//    }
}

function monthSelection(current_input) {
//    if (!current_input.checked) {
//        document.forms["monthlyIncomeReportName"]["chkAllTheMonths"].checked = false;
//    } else {
//        var i = 0;
//        for (; i < 12; i++) {
//            if (!document.forms["monthlyIncomeReportName"][monthCheckBox[i]].checked) {
//                break;
//            }
//        }
//        if (i == 12) {
//            document.forms["monthlyIncomeReportName"]["chkAllTheMonths"].checked = true;
//        }
//    }
}

$(function() {
    $("#datepicker1").datepicker({showOtherMonths: true, selectOtherMonths: true});
    $("#datepicker1").datepicker("option", "dateFormat", "yy-mm-dd");
});


$(function() {
    $("#datepicker2").datepicker({showOtherMonths: true, selectOtherMonths: true});
    $("#datepicker2").datepicker("option", "dateFormat", "yy-mm-dd");
});

