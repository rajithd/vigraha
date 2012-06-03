function dateValidator(stringDate, err1, err2, err3) {
    if (stringDate == "") {
        showDateError(err1);
        return false;
    }
    var leapYearDays = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var normalYearDays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

    var dateRegEx = "\\d{4}-\\d{2}-\\d{2}";

    if (stringDate.match(dateRegEx)) {
        var dateArray = stringDate.split("-");
        var year = parseInt(dateArray[0], 10);
        var month = parseInt(dateArray[1], 10);
        var day = parseInt(dateArray[2], 10);
        if ((year > 0) && (month > 0) && (month <= 12) && (day > 0)) {
            if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)) {
                if (day <= leapYearDays[month - 1]) {
                    if (!pastDatesOnly(stringDate)) {
                        showDateError(err3);
                        return false;
                    }
                } else {
                    showDateError(err2);
                    return false;
                }
            } else {
                if (day <= normalYearDays[month - 1]) {
                    if (!pastDatesOnly(stringDate)) {
                        showDateError(err3);
                        return false;
                    }
                } else {
                    showDateError(err2);
                    return false;
                }
            }
        } else {
            showDateError(err2);
            return false;
        }
    } else {
        showDateError(err2);
        return false;
    }
    return true;
}

function showDateError(errID) {
    document.getElementById("dateAlert").innerText = errID;
    document.getElementById("dateAlert").style.visibility = "visible";
}

function pastDatesOnly(stringDate) {
    var dateArray = stringDate.split("-");

    var today = new Date();
    var givenDate = new Date();
    givenDate.setFullYear(parseInt(dateArray[0], 10), parseInt(dateArray[1], 10) - 1, parseInt(dateArray[2], 10));

    return givenDate < today;
}

function datePickAlertNeutralize() {
    document.getElementById("dateAlert").style.visibility = "hidden";
}

function spAlertNeutralize() {
    document.getElementById("spAlert").style.visibility = "hidden";
}

function appAlertNeutralize() {
    document.getElementById("appAlert").style.visibility = "hidden";
}

function operatorAlertNeutralize() {
    document.getElementById("operatorAlert").style.visibility = "hidden";
}

function monthAlertNeutralize() {
    document.getElementById("monthAlert").style.visibility = "hidden";
}

function addAlertNeutralize() {
    document.getElementById("addAlert").style.visibility = "hidden";
}

function yearAlertNeutralize() {
    document.getElementById("yearAlert").style.visibility = "hidden";
}

function setApplications(selectedValue, defaultCode) {
    spAlertNeutralize();
    appAlertNeutralize();

    if (selectedValue == "") {
        $('#apps').html("<option value=\"\" selected=\"selected\">" + defaultCode + "</option>");
        return;
    }

    $(document).ready(function() {
        $('#apps').load("getApplications?spId=" + selectedValue);
    });

}

function monthlyRevenue(current_form) {
    var yearsSelector = current_form["years"];
    var year = yearsSelector.options[yearsSelector.selectedIndex].value;
    var monthsSelector = current_form["months"];
    if (monthsSelector.selectedIndex == -1) {
        document.getElementById("monthAlert").style.visibility = "visible";
        return false;
    } else {
        var selectedArray = new Array();
        var count = 0;
        for (var i = 0; i < monthsSelector.options.length; i++) {
            if (monthsSelector.options[i].selected) {
                selectedArray[count] = monthsSelector.options[i].value;
                count++;
            }
        }
        current_form["monthly_rp_year"].value = year;
        current_form["monthly_rp_months"].value = selectedArray.toString();
        current_form["monthly_rp_show_graph"].value = current_form["chkShowChart"].checked;
        return true;
    }
}

function dailyRevenue(current_form, err1, err2, err3, err4, err5) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;
    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        } else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        current_form["daily_rp_from_date"].value = current_form["fromDate"].value;
        current_form["daily_rp_to_date"].value = current_form["toDate"].value;
        current_form["daily_rp_show_graph"].value = current_form["chkShowChart"].checked;
        return true;
    } else {
        return false;
    }
}

function monthlyCorporate(current_form, errmaxsp, errnosp, maxSp) {
    current_form["cop_user_based_monthly_rp_show_report"].value = current_form["chkShowChart"].checked;

    var yearsSelector = current_form["years"];
    current_form["cop_user_based_monthly_rp_year"].value = yearsSelector.options[yearsSelector.selectedIndex].value;

    var selectedArray = new Array();
    var selObj = current_form["months"];
    if (selObj.selectedIndex == -1) {
        document.getElementById("monthAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < selObj.options.length; i++) {
            if (selObj.options[i].selected) {
                selectedArray[count] = selObj.options[i].value;
                count++;
            }
        }
        current_form["cop_user_based_monthly_rp_months"].value = selectedArray.toString();
    }

    //====================================================================================
    var spid = new Array();
    var spname = new Array();
    var selObj2 = current_form["providers"];
    if (selObj2.selectedIndex == -1) {
        document.getElementById("spAlert").innerText = errnosp;
        document.getElementById("spAlert").style.visibility = "visible";
        return false;
    } else {
        count = 0;
        for (i = 0; i < selObj2.options.length; i++) {
            if (selObj2.options[i].selected) {
                spid[count] = selObj2.options[i].value.split("+")[0];
                spname[count] = selObj2.options[i].value.split("+")[1];
                count++;
            }
        }
        if (count > maxSp) {
            document.getElementById("spAlert").innerText = errmaxsp;
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        }

        current_form["cop_user_based_monthly_rp_sp_ids"].value = spid.toString();
        current_form["cop_user_based_monthly_rp_sp_names"].value = spname.toString();

        return true;
    }
}

function dailyCorporate(current_form, err1, err2, err3, err4, err5, errmaxsp, errnosp, maxSp) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;
    var selObj2 = current_form["providers"];


    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        } else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        current_form["cop_user_based_daily_rp_from_date"].value = fromDateString;
        current_form["cop_user_based_daily_rp_to_date"].value = toDateString;
        if (selObj2.selectedIndex == -1) {
            document.getElementById("spAlert").innerText = errnosp;
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        } else {
            var spid = new Array();
            var spname = new Array();
            var count = 0;
            for (var i = 0; i < selObj2.options.length; i++) {
                if (selObj2.options[i].selected) {
                    spid[count] = selObj2.options[i].value.split("+")[0];
                    spname[count] = selObj2.options[i].value.split("+")[1];
                    count++;
                }
            }
            if (count > maxSp) {
                document.getElementById("spAlert").innerText = errmaxsp;
                document.getElementById("spAlert").style.visibility = "visible";
                return false;
            }
            current_form["cop_user_based_daily_rp_sp_ids"].value = spid.toString();
            current_form["cop_user_based_daily_rp_sp_names"].value = spname.toString();
            current_form["cop_user_based_daily_rp_show_report"].value = current_form["chkShowChart"].checked;
            return true;

        }
    } else {
        return false;
    }
}

function yearlyNCS(current_form, type) {
    var operatorIdArray = new Array();
    var operatorNameArray = new Array();
    var yearArray = new Array();

    var operatorSelector = current_form["operators"];
    var yearSelector = current_form["years"];
    var count = 0;

    if (yearSelector.selectedIndex == -1) {
        document.getElementById("yearAlert").style.visibility = "visible";
        return false;
    } else {
        for (i = 0; i < yearSelector.options.length; i++) {
            if (yearSelector.options[i].selected) {
                yearArray[count] = yearSelector.options[i].value;
                count++;
            }
        }

        current_form["ncs_yearly_rp_years"].value = yearArray.toString();
        current_form["ncs_yearly_rp_show_report"].value = current_form["chkShowChart"].checked;

    }

    if (type == 1) {
        if (operatorSelector.selectedIndex == -1) {
            document.getElementById("operatorAlert").style.visibility = "visible";
            return false;
        } else {
            count = 0;
            for (var i = 0; i < operatorSelector.options.length; i++) {
                if (operatorSelector.options[i].selected) {
                    operatorIdArray[count] = operatorSelector.options[i].value.split("+")[0];
                    operatorNameArray[count] = operatorSelector.options[i].value.split("+")[1];
                    count++;
                }
            }

            current_form["ncs_yearly_rp_operator_ids"].value = operatorIdArray.toString();
            current_form["ncs_yearly_rp_operator_names"].value = operatorNameArray.toString();
            return true;
        }
    }

}

function monthlyNCS(current_form, type) {
    var operatorIdArray = new Array();
    var operatorNameArray = new Array();
    var monthArray = new Array();

    var operatorSelector = current_form["operators"];
    var yearSelector = current_form["year"];
    var monthSelector = current_form["months"];

    var count = 0;
    if (monthSelector.selectedIndex == -1) {
        document.getElementById("monthAlert").style.visibility = "visible";
        return false;
    } else {
        for (i = 0; i < monthSelector.options.length; i++) {
            if (monthSelector.options[i].selected) {
                monthArray[count] = monthSelector.options[i].value;
                count++;
            }
        }
        current_form["ncs_monthly_rp_months"].value = monthArray.toString();

    }

    if (type == 1) {
        if (operatorSelector.selectedIndex == -1) {
            document.getElementById("operatorAlert").style.visibility = "visible";
            return false;
        } else {
            count = 0;
            for (var i = 0; i < operatorSelector.options.length; i++) {
                if (operatorSelector.options[i].selected) {
                    operatorIdArray[count] = operatorSelector.options[i].value.split("+")[0];
                    operatorNameArray[count] = operatorSelector.options[i].value.split("+")[1];
                    count++;
                }
            }

            current_form["ncs_monthly_rp_operator_ids"].value = operatorIdArray.toString();
            current_form["ncs_monthly_rp_operator_names"].value = operatorNameArray.toString();
        }
    }

    current_form["ncs_monthly_rp_year"].value = yearSelector.options[yearSelector.selectedIndex].value;
    current_form["ncs_monthly_rp_show_report"].value = current_form["chkShowChart"].checked;

    return true;
}

function dailyNCS(current_form, type, err1, err2, err3, err4, err5) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;
    var operatorSelector = current_form["operators"];

    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        } else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        current_form["ncs_daily_rp_from_date"].value = fromDateString;
        current_form["ncs_daily_rp_to_date"].value = toDateString;

        if (type == 1) {
            if (operatorSelector.selectedIndex == -1) {
                document.getElementById("operatorAlert").style.visibility = "visible";
                return false;
            } else {
                var operatorIdArray = new Array();
                var operatorNameArray = new Array();

                var count = 0;
                for (var i = 0; i < operatorSelector.options.length; i++) {
                    if (operatorSelector.options[i].selected) {
                        operatorIdArray[count] = operatorSelector.options[i].value.split("+")[0];
                        operatorNameArray[count] = operatorSelector.options[i].value.split("+")[1];
                        count++;
                    }
                }
                current_form["ncs_daily_rp_operator_ids"].value = operatorIdArray.toString();
                current_form["ncs_daily_rp_operator_names"].value = operatorNameArray.toString();

            }
        }

        current_form["ncs_daily_rp_show_report"].value = current_form["chkShowChart"].checked;

        return true;
    } else {
        return false;
    }
}

$(function() {
    $("#datepicker1").datepicker({showOtherMonths: true, selectOtherMonths: true});
    $("#datepicker1").datepicker("option", "dateFormat", "yy-mm-dd");
});


$(function() {
    $("#datepicker2").datepicker({showOtherMonths: true, selectOtherMonths: true});
    $("#datepicker2").datepicker("option", "dateFormat", "yy-mm-dd");
});

function loopSelected(current_form) {
    var selectedArray = new Array();
    var selObj = current_form["years"];
    if (selObj.selectedIndex == -1) {
        document.getElementById("yearAlert").style.visibility = "visible";
        return false;
    } else {

        var i;
        var count = 0;
        for (i = 0; i < selObj.options.length; i++) {
            if (selObj.options[i].selected) {
                selectedArray[count] = selObj.options[i].value;
                count++;
            }
        }
        document.getElementById('RP_yearly_revenue_year').value = selectedArray.toString();

        document.getElementById("RP_show_graphs").value = current_form["chkShowChart"].checked;
        return true;
    }

}


function spSelection(current_form, errmaxsp, errnosp, maxSp) {
    var selectedArray = new Array();
    var selObj = current_form["years"];
    if (selObj.selectedIndex == -1) {
        document.getElementById("yearAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < selObj.options.length; i++) {
            if (selObj.options[i].selected) {
                selectedArray[count] = selObj.options[i].value;
                count++;
            }
        }
        document.getElementById('RP_yearly_co_user_year').value = selectedArray.toString();
    }

    document.getElementById("RP_show_graphs").value = current_form["chkShowChart"].checked;


    var selectedArrayNames = new Array();
    var selObj2 = current_form["spNames"];
    if (selObj2.selectedIndex == -1) {
        document.getElementById("spAlert").innerText = errnosp;
        document.getElementById("spAlert").style.visibility = "visible";
        return false;
    } else {
        var j;
        var count2 = 0;
        for (j = 0; j < selObj2.options.length; j++) {
            if (selObj2.options[j].selected) {
                selectedArrayNames[count2] = selObj2.options[j].value;
                count2++;
            }
        }
        if (count2 > maxSp) {
            document.getElementById("spAlert").innerText = errmaxsp;
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        }
        var spid = new Array();
        var spname = new Array();
        for (var jj = 0; jj < selectedArrayNames.length; jj++) {
            spname[jj] = selectedArrayNames[jj].slice(0, selectedArrayNames[jj].indexOf("(", 0));
            spid[jj] = selectedArrayNames[jj].slice(selectedArrayNames[jj].indexOf("(", 0) + 1, selectedArrayNames[jj].indexOf(")", 0));
        }
        document.getElementById('RP_yearly_co_user_name').value = spname.toString();
        document.getElementById('RP_yearly_co_user_id').value = spid.toString();

        return true;
    }
}

function appSelection(current_form, type, errmaxapp, errnoapp, maxApp) {
    var selectedArray = new Array();
    var yearSelector = current_form["years"];
    var appSelector = current_form["apps"];

    if (yearSelector.selectedIndex == -1) {
        document.getElementById("yearAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < yearSelector.options.length; i++) {
            if (yearSelector.options[i].selected) {
                selectedArray[count] = yearSelector.options[i].value;
                count++;
            }
        }
        document.getElementById('RP_app_year').value = selectedArray.toString();
    }

    document.getElementById("RP_show_graphs").value = current_form["chkShowChart"].checked;

    if (type == 1) {
        var spSelector = current_form["providers"];
        var spSelectedString = spSelector.options[spSelector.selectedIndex].value;
        if (spSelectedString == "") {
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        } else {
            current_form["RP_sp_id"].value = spSelectedString.split("+")[0];
            current_form["RP_sp_name"].value = spSelectedString.split("+")[1];
        }
    }


    if (appSelector.selectedIndex == -1) {
        document.getElementById("appAlert").innerText = errnoapp;
        document.getElementById("appAlert").style.visibility = "visible";
        return false;
    } else {
        var count2 = 0;
        var appId = new Array();
        var appName = new Array();
        for (var j = 0; j < appSelector.options.length; j++) {
            if (appSelector.options[j].selected) {
                appId[count2] = appSelector.options[j].value.split("+")[0];
                appName[count2] = appSelector.options[j].value.split("+")[1];
                count2++;
            }
        }
        if (count2 > maxApp) {
            document.getElementById("appAlert").innerText = errmaxapp;
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        }
        document.getElementById('RP_app_name').value = appName.toString();
        document.getElementById('RP_app_id').value = appId.toString();
        return true;
    }
}

function reconciliationSelection(current_form) {
    var yearsSelector = current_form["years"];
    current_form["RP_reconciliation_year"].value = yearsSelector.options[yearsSelector.selectedIndex].value;

    var monthSelector = current_form["months"];
    current_form["RP_reconciliation_month"].value = monthSelector.options[monthSelector.selectedIndex].value;

    var spIdArray = new Array();
    var coopIdArray = new Array();
    var spSelector = current_form["providers"];
    if (spSelector.selectedIndex == -1) {
        document.getElementById("spAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < spSelector.options.length; i++) {
            if (spSelector.options[i].selected) {
                spIdArray[count] = spSelector.options[i].value.split("+")[0];
                coopIdArray[count] = spSelector.options[i].value.split("+")[2];
                count++;
            }
        }
        document.getElementById('RP_reconciliation_sp').value = spIdArray.toString();
        document.getElementById('RP_reconciliation_coopId').value = coopIdArray.toString();
    }
    return true;
}

function monthlyAppSelection(current_form, type, errmaxapp, errnoapp, maxApp) {
    document.getElementById("RP_show_graphs").value = current_form["chkShowChart"].checked;

    var yearsSelector = current_form["years"];
    current_form["RP_app_monthly_year"].value = yearsSelector.options[yearsSelector.selectedIndex].value;

    //RP_app_monthly_appname
    var selectedArray = new Array();
    var monthSelector = current_form["months"];
    if (monthSelector.selectedIndex == -1) {
        document.getElementById("monthAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < monthSelector.options.length; i++) {
            if (monthSelector.options[i].selected) {
                selectedArray[count] = monthSelector.options[i].value;
                count++;
            }
        }
        document.getElementById('RP_app_monthly_month').value = selectedArray.toString();
    }

    if (type == 1) {
        var spSelector = current_form["providers"];
        var spSelectedString = spSelector.options[spSelector.selectedIndex].value;
        if (spSelectedString == "") {
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        } else {
            current_form["RP_app_monthly_sp_id"].value = spSelectedString.split("+")[0];
            current_form["RP_app_monthly_sp_name"].value = spSelectedString.split("+")[1];
        }
    }

    //====================================================================================
    var appSelector = current_form["apps"];
    if (appSelector.selectedIndex == -1) {
        document.getElementById("appAlert").innerText = errnoapp;
        document.getElementById("appAlert").style.visibility = "visible";
        return false;
    } else {
        var appId = new Array();
        var appName = new Array();
        var count2 = 0;
        for (var j = 0; j < appSelector.options.length; j++) {
            if (appSelector.options[j].selected) {
                appId[count2] = appSelector.options[j].value.split("+")[0];
                appName[count2] = appSelector.options[j].value.split("+")[1];
                count2++;
            }
        }
        if (count2 > maxApp) {
            document.getElementById("appAlert").innerText = errmaxapp;
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        }


        document.getElementById('RP_app_monthly_appname').value = appName.toString();
        document.getElementById('RP_app_monthly_appid').value = appId.toString();

        return true;
    }

}

function dailyAppSelection(current_form, type, err1, err2, err3, err4, err5, maxAppErr, noAppErr, maxApp) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;

    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        }
        else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        document.getElementById('RP_app_daily_start_date').value = fromDateString;
        document.getElementById('RP_app_daily_end_date').value = toDateString;

        document.getElementById("RP_show_graphs").value = current_form["chkShowChart"].checked;

        if (type == 1) {
            var spSelector = current_form["providers"];
            var spSelectedString = spSelector.options[spSelector.selectedIndex].value;
            if (spSelectedString == "") {
                document.getElementById("spAlert").style.visibility = "visible";
                return false;
            } else {
                current_form["RP_app_daily_sp_id"].value = spSelectedString.split("+")[0];
                current_form["RP_app_daily_sp_name"].value = spSelectedString.split("+")[1];
            }
        }

        var appId = new Array();
        var appName = new Array();
        var appSelector = current_form["apps"];
        if (appSelector.selectedIndex == -1) {
            document.getElementById("appAlert").innerText = noAppErr;
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        }
        else {
            var count2 = 0;
            for (var j = 0; j < appSelector.options.length; j++) {
                if (appSelector.options[j].selected) {
                    appId[count2] = appSelector.options[j].value.split("+")[0];
                    appName[count2] = appSelector.options[j].value.split("+")[1];
                    count2++;
                }
            }
            if (count2 > maxApp) {
                document.getElementById("appAlert").innerText = maxAppErr;
                document.getElementById("appAlert").style.visibility = "visible";
                return false;
            }

            document.getElementById('RP_app_daily_appname').value = appName.toString();
            document.getElementById('RP_app_daily_appid').value = appId.toString();
        }

        return true;
    }
    return false;

}

function governanceSelection(current_form, err1, err2, err3, err4, err5, noAppErr) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;

    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        }
        else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        document.getElementById('RP_governance_start_date').value = fromDateString;
        document.getElementById('RP_governance_end_date').value = toDateString;

        var appIdArray = new Array();
        var appSelector = current_form["appDetails"];
        if (appSelector.selectedIndex == -1) {
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        } else {
            var i;
            var count = 0;
            for (i = 0; i < appSelector.options.length; i++) {
                if (appSelector.options[i].selected) {
                    appIdArray[count] = appSelector.options[i].value.split("+")[0];
                    count++;
                }
            }
            document.getElementById('RP_governance_app_id').value = appIdArray.toString();
            return true;
        }
    }
    return false;
}


function yearlyOPSelection() {
    var selectedArray = new Array();
    var selObj = document.getElementById("years");
    if (selObj.selectedIndex == -1) {
        document.getElementById("yearAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < selObj.options.length; i++) {
            if (selObj.options[i].selected) {
                selectedArray[count] = selObj.options[i].value;
                count++;
            }
        }
        document.getElementById('RP_yearly_ope_year').value = selectedArray.toString();
    }

    document.getElementById("RP_yearly_ope_showGraph").value = document.getElementById("chkShowChart").checked;

    var selectedArrayOp = new Array();
    var selectedArrayOpName = new Array();
    var selObjOp = document.getElementById("opNames");
    if (selObjOp.selectedIndex == -1) {
        document.getElementById("operatorAlert").style.visibility = "visible";
        return false;
    } else {
        var count2 = 0;
        for (var j = 0; j < selObjOp.options.length; j++) {
            if (selObjOp.options[j].selected) {
                selectedArrayOp[count2] = selObjOp.options[j].value.split("+")[0];
                selectedArrayOpName[count2] = selObjOp.options[j].value.split("+")[1];
                count2++;
            }
        }
        document.getElementById('RP_yearly_ope_opid').value = selectedArrayOp.toString();
        document.getElementById('RP_yearly_ope_opname').value = selectedArrayOpName.toString();

        return true;
    }

}

function monthlyOpSelection() {
    document.getElementById("RP_monthly_op_showGraphs").value = document.getElementById("chkShowChart").checked;

    var yearsSelector = document.getElementById("years");
    document.getElementById("RP_monthly_op_year").value = yearsSelector.options[yearsSelector.selectedIndex].value;

    var selectedArray = new Array();
    var selObj = document.getElementById("months");
    if (selObj.selectedIndex == -1) {
        document.getElementById("monthAlert").style.visibility = "visible";
        return false;
    } else {
        var i;
        var count = 0;
        for (i = 0; i < selObj.options.length; i++) {
            if (selObj.options[i].selected) {
                selectedArray[count] = selObj.options[i].value;
                count++;
            }
        }
        document.getElementById('RP_monthly_op_month').value = selectedArray.toString();
    }

    //====================================================================================
    var selectedArrayNames = new Array();
    var selectedArrayId = new Array();
    var selObj2 = document.getElementById("opNames");
    if (selObj2.selectedIndex == -1) {
        document.getElementById("operatorAlert").style.visibility = "visible";
        return false;
    } else {
        var j;
        var count2 = 0;
        for (j = 0; j < selObj2.options.length; j++) {
            if (selObj2.options[j].selected) {
                selectedArrayId[count2] = selObj2.options[j].value.split("+")[0];
                selectedArrayNames[count2] = selObj2.options[j].value.split("+")[1];
                count2++;
            }
        }
        document.getElementById('RP_monthly_op_opname').value = selectedArrayNames.toString();
        document.getElementById('RP_monthly_op_opid').value = selectedArrayId.toString();

        return true;
    }

}


function dailyOPSelection(err1, err2, err3, err4, err5) {

    var fromDateString = document.getElementById('datepicker1').value;
    var toDateString = document.getElementById('datepicker2').value;

    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        } else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        document.getElementById('RP_daily_op_start_date').value = fromDateString;
        document.getElementById('RP_daily_op_end_date').value = toDateString;

        if (document.getElementById("chkShowChart").checked) {
            document.getElementById("RP_daily_op_showGraphs").value = "True";
        }
        else {
            document.getElementById("RP_daily_op_showGraphs").value = "False";
        }


        var selectedArrayNames = new Array();
        var selectedArrayId = new Array();
        var selObj2 = document.getElementById("opNames");
        if (selObj2.selectedIndex == -1) {
            document.getElementById("operatorAlert").style.visibility = "visible";
            return false;
        } else {
            var j;
            var count2 = 0;
            for (j = 0; j < selObj2.options.length; j++) {
                if (selObj2.options[j].selected) {
                    selectedArrayId[count2] = selObj2.options[j].value.split("+")[0];
                    selectedArrayNames[count2] = selObj2.options[j].value.split("+")[1];
                    count2++;
                }
            }
            document.getElementById('RP_daily_op_opid').value = selectedArrayId.toString();
            document.getElementById('RP_daily_op_opname').value = selectedArrayNames.toString();

            return true;
        }
    } else {
        return false;
    }
}

function failedReport(err1, err2, err3, err4, err5) {
    var fromDateString = document.getElementById('datepicker1').value;
    var toDateString = document.getElementById('datepicker2').value;

    if (dateValidator(fromDateString, err1, err2, err3) && dateValidator(toDateString, err1, err2, err3)) {
        var fromDateArray = fromDateString.split("-");
        var toDateArray = toDateString.split("-");
        var fromDate = new Date();
        var toDate = new Date();
        fromDate.setFullYear(parseInt(fromDateArray[0], 10), parseInt(fromDateArray[1], 10) - 1, parseInt(fromDateArray[2], 10));
        toDate.setFullYear(parseInt(toDateArray[0], 10), parseInt(toDateArray[1], 10) - 1, parseInt(toDateArray[2], 10));
        if (toDate < fromDate) {
            showDateError(err4);
            return false;
        } else if (toDate - fromDate > 2592000000) {
            showDateError(err5);
            return false;
        }
        document.getElementById('RP_failed_trans_start_date').value = fromDateString;
        document.getElementById('RP_failed_trans_end_date').value = toDateString;
        return true;
    }
    else {
        return false;
    }


}

function yearlyAdd() {
    var yearsSelector = document.getElementById("years");
    document.getElementById("RP_yearly_add_year").value = yearsSelector.options[yearsSelector.selectedIndex].value;

    var selectedArrayNames = new Array();
    var selObj2 = document.getElementById("addNames");
    if (selObj2.selectedIndex == -1) {
        document.getElementById("addAlert").style.visibility = "visible";
        return false;
    } else {
        var j;
        var count2 = 0;
        for (j = 0; j < selObj2.options.length; j++) {
            if (selObj2.options[j].selected) {
                selectedArrayNames[count2] = selObj2.options[j].value;
                count2++;
            }
        }
        document.getElementById('RP_yearly_add_addname').value = selectedArrayNames.toString();

        return true;
    }

}

function monthlyAdd() {
    var yearsSelector = document.getElementById("years");
    document.getElementById("RP_monthly_add_year").value = yearsSelector.options[yearsSelector.selectedIndex].value;

    var selectedMonth = document.getElementById("months");
    document.getElementById("RP_monthly_add_month").value = selectedMonth.options[selectedMonth.selectedIndex].value;

    var selectedArrayNames = new Array();
    var selObj2 = document.getElementById("addNames");
    if (selObj2.selectedIndex == -1) {
        document.getElementById("addAlert").style.visibility = "visible";
        return false;
    } else {
        var j;
        var count2 = 0;
        for (j = 0; j < selObj2.options.length; j++) {
            if (selObj2.options[j].selected) {
                selectedArrayNames[count2] = selObj2.options[j].value;
                count2++;
            }
        }
        document.getElementById('RP_monthly_add_addname').value = selectedArrayNames.toString();

        return true;
    }

}

function yearlyAppAdd(type, errmaxapp, errnoapp, maxApp) {
    var yearsSelector = document.getElementById("years");
    var yearSelector = document.getElementById("years");
    var appSelector = document.getElementById("apps");
    document.getElementById("RP_yearly_app_add_year").value = yearsSelector.options[yearsSelector.selectedIndex].value;

    if (type == 1) {
        var spSelector = document.getElementById("providers");
        var spSelectedString = spSelector.options[spSelector.selectedIndex].value;
        if (spSelectedString == "") {
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        } else {
            document.getElementById("RP_yearly_app_add_sp_id").value = spSelectedString.split("+")[0];
            document.getElementById("RP_yearly_app_add_sp_name").value = spSelectedString.split("+")[1];
        }
    }


    if (appSelector.selectedIndex == -1) {
        document.getElementById("appAlert").innerText = errnoapp;
        document.getElementById("appAlert").style.visibility = "visible";
        return false;
    } else {
        var count2 = 0;
        var appId = new Array();
        var appName = new Array();
        for (var j = 0; j < appSelector.options.length; j++) {
            if (appSelector.options[j].selected) {
                appId[count2] = appSelector.options[j].value.split("+")[0];
                appName[count2] = appSelector.options[j].value.split("+")[1];
                count2++;
            }
        }
        if (count2 > maxApp) {
            document.getElementById("appAlert").innerText = errmaxapp;
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        }
        document.getElementById('RP_yearly_app_add_app_name').value = appName.toString();
        document.getElementById('RP_yearly_app_add_app_id').value = appId.toString();
        return true;
    }

}

function monthlyAppAdd(type, errmaxapp, errnoapp, maxApp) {
    var yearsSelector = document.getElementById("years");
    document.getElementById("RP_monthly_app_add_year").value = yearsSelector.options[yearsSelector.selectedIndex].value;

    var selectedMonth = document.getElementById("months");
    document.getElementById("RP_monthly_app_add_month").value = selectedMonth.options[selectedMonth.selectedIndex].value;

    if (type == 1) {
        var spSelector = document.getElementById("providers");
        var spSelectedString = spSelector.options[spSelector.selectedIndex].value;
        if (spSelectedString == "") {
            document.getElementById("spAlert").style.visibility = "visible";
            return false;
        } else {
            document.getElementById("RP_monthly_app_add_sp_id").value = spSelectedString.split("+")[0];
            document.getElementById("RP_monthly_app_add_sp_name").value = spSelectedString.split("+")[1];
        }
    }

    //====================================================================================
    var appSelector = document.getElementById("apps");
    if (appSelector.selectedIndex == -1) {
        document.getElementById("appAlert").innerText = errnoapp;
        document.getElementById("appAlert").style.visibility = "visible";
        return false;
    } else {
        var appId = new Array();
        var appName = new Array();
        var count2 = 0;
        for (var j = 0; j < appSelector.options.length; j++) {
            if (appSelector.options[j].selected) {
                appId[count2] = appSelector.options[j].value.split("+")[0];
                appName[count2] = appSelector.options[j].value.split("+")[1];
                count2++;
            }
        }
        if (count2 > maxApp) {
            document.getElementById("appAlert").innerText = errmaxapp;
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        }


        document.getElementById('RP_monthly_app_add_app_name').value = appName.toString();
        document.getElementById('RP_monthly_app_add_app_id').value = appId.toString();

        return true;
    }

}


