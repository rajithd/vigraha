function dateValidator(stringDate,err1,err2,err3) {
    if(stringDate==""){
        showDateError(err1);
        return false;
    }
    var leapYearDays = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    var normalYearDays = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

    var dateRegEx = "\\d{4}-\\d{2}-\\d{2}";

    if(stringDate.match(dateRegEx)){
        var dateArray = stringDate.split("-");
        var year = parseInt(dateArray[0], 10);
        var month = parseInt(dateArray[1], 10);
        var day = parseInt(dateArray[2], 10);
        if((year > 0) && (month > 0) && (month <= 12) && (day > 0)){
            if(year%400 ==0 || (year%100 != 0 && year%4 == 0)){
                if(day <= leapYearDays[month - 1]) {
                    if(!pastDatesOnly(stringDate)){
                        showDateError(err3);
                        return false;
                    }
                } else {
                    showDateError(err2);
                    return false;
                }
            } else {
                 if(day <= normalYearDays[month - 1]) {
                    if(!pastDatesOnly(stringDate)){
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

function showDateError(errID){
     document.getElementById("dateAlert").innerText = errID;
     document.getElementById("dateAlert").style.visibility = "visible";
}

function pastDatesOnly(stringDate) {
    var dateArray = stringDate.split("-");

    var today = new Date();
    var givenDate = new Date();
    givenDate.setFullYear(parseInt(dateArray[0], 10), parseInt(dateArray[1], 10) - 1, parseInt(dateArray[2], 10));

    return givenDate <= today;
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

function setApplications(selectedValue, defaultCode) {
    spAlertNeutralize();
    appAlertNeutralize();

    if (selectedValue=="") {
        $('#apps').html("<option value=\"\" selected=\"selected\">" + defaultCode + "</option>");
        return;
    }

    $(document).ready(function(){
        $('#apps').load("getApplications?spId="+selectedValue);
    });
}

function validateDetailedTransaction(current_form,type,err1,err2,err3,err4,err5) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;
    var appSelector = document.getElementById("apps");
    var appSelectedNo = appSelector.selectedIndex;
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
        }else if(toDate-fromDate > 2592000000){
            showDateError(err5);
            return false;
        }
        if(type==1){
            var spSelector = document.getElementById("providers");
            var spSelectedString = spSelector.options[spSelector.selectedIndex].value;

            if (spSelectedString == "") {
                document.getElementById("spAlert").style.visibility = "visible";
                return false;
            }else{
                current_form["sp_id"].value = spSelectedString.split("+")[0];
                current_form["sp_name"].value = spSelectedString.split("+")[1];
            }
        }
        if (appSelectedNo == -1) {
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        } else {
            var appIdArray = new Array();
            var appNameArray = new Array();
            var count = 0;
            for (var i = 0; i < appSelector.options.length; i++) {
                if (appSelector.options[i].selected) {
                    appIdArray[count] = appSelector.options[i].value.split("+")[0];
                    appNameArray[count] = appSelector.options[i].value.split("+")[1];
                    count++;
                }
            }
        }


        current_form["app_ids"].value = appIdArray.toString();
        current_form["app_names"].value = appNameArray.toString();
        return true;
    }
    else {
        return false;
    }
}

function validateFailedTransaction(current_form,type,err1,err2,err3,err4,err5) {
    var fromDateString = current_form["fromDate"].value;
    var toDateString = current_form["toDate"].value;
    var appSelector = document.getElementById("apps");
    var appSelectedNo = appSelector.selectedIndex;
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
        }else if(toDate-fromDate > 2592000000){
            showDateError(err5);
            return false;
        }
        if(type==1){
            var spSelector = document.getElementById("providers");
            var spSelectedString = spSelector.options[spSelector.selectedIndex].value;

            if (spSelectedString == "") {
                document.getElementById("spAlert").style.visibility = "visible";
                return false;
            }else{
                current_form["sp_id"].value = spSelectedString.split("+")[0];
                current_form["sp_name"].value = spSelectedString.split("+")[1];
            }
        }
        if (appSelectedNo == -1) {
            document.getElementById("appAlert").style.visibility = "visible";
            return false;
        } else {
            var appIdArray = new Array();
            var appNameArray = new Array();
            var count = 0;
            for (var i = 0; i < appSelector.options.length; i++) {
                if (appSelector.options[i].selected) {
                    appIdArray[count] = appSelector.options[i].value.split("+")[0];
                    appNameArray[count] = appSelector.options[i].value.split("+")[1];
                    count++;
                }
            }
        }
        current_form["app_ids"].value = appIdArray.toString();
        current_form["app_names"].value = appNameArray.toString();
        return true;
    }
    else {
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

