$(document).ready(function () { 
            $('.modal-timepicker').timepicker({
                defaultTime: 'current',
                minuteStep: 15,
                disableFocus: true,
                template: 'modal'
            });
            $('.dropdown-timepicker').timepicker({
                defaultTime: 'current',
                minuteStep: 15,
                disableFocus: true,
                template: 'dropdown'
            });

        });