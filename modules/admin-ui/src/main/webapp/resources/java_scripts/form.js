/* DO NOT MODIFY. This file was compiled Mon, 21 May 2012 18:43:42 GMT from
 * /builddir/build/BUILD/rhc-site-0.92.7/app/coffeescripts/form.coffee
 */

(function() {
  var $, find_control_group_parent;
  $ = jQuery;
  find_control_group_parent = function(child) {
    var parent;
    parent = $(child).parentsUntil(".control-group").parent().closest(".control-group");
    return parent;
  };
  $(function() {
    var loading_match;
    loading_match = '*[data-loading=true]';
    ($('form ' + loading_match)).each(function() {
      ($(window)).bind('pagehide', function() {
        ($(loading_match, body)).hide();
        return ($('input[type=submit][disabled]')).removeAttr('disabled');
      });
      return ($(this)).closest('form').bind('submit', function() {
        if (($('.control-group.error-client')).length === 0) {
          ($(loading_match, this)).show();
          ($('input[type=submit]', this)).attr('disabled', 'disabled');
          return true;
        }
      });
    });
    $.validator.addMethod("aws_account", (function(value) {
      return /^[\d]{4}-[\d]{4}-[\d]{4}$/.test(value);
    }), "Account numbers should be a 12-digit number separated by dashes. Ex: 1234-5678-9000");
    $.validator.addMethod("alpha_numeric", (function(value) {
      return /^[A-Za-z0-9]*$/.test(value);
    }), "Only letters and numbers are allowed");
    $.validator.setDefaults({
      errorClass: 'help-inline',
      errorElement: 'p',
      highlight: function(element, errorClass, validClass) {
        return $(find_control_group_parent(element)).addClass('error').addClass('error-client').removeClass(validClass);
      },
      unhighlight: function(element, errorClass, validClass) {
        var $el;
        $el = $(find_control_group_parent(element));
        $el.removeClass('error-client');
        if (typeof ($el.attr('data-server-error')) === 'undefined') {
          return $el.removeClass('error');
        }
      }
    });
    $('#new-user form').validate({
      rules: {
        "web_user[email_address]": {
          required: true,
          email: true
        },
        "web_user[old_password]": {
          required: true
        },
        "web_user[password]": {
          required: true,
          minlength: 6
        },
        "web_user[password_confirmation]": {
          required: true,
          equalTo: "#web_user_password"
        }
      }
    });
    $('#login-form form').validate({
      rules: {
        "web_user[rhlogin]": {
          required: true
        },
        "web_user[password]": {
          required: true
        }
      }
    });
    $('#password-reset-form form').validate({
      rules: {
        "email": {
          required: true,
          email: true
        }
      }
    });
    $.validator.addClassRules({
      domain_name: {
        required: true,
        alpha_numeric: true
      },
      application_name: {
        required: true,
        alpha_numeric: true
      }
    });
    $("#new_domain form").validate({
      errorLabelContainer: '#app-errors',
      errorContainer: '#app-errors'
    });
    return $("[data-unhide]").click(function(event) {
      var src, tgt;
      src = $(this);
      tgt = $(src.attr('data-unhide'));
      if (tgt) {
        if (event != null) {
          event.preventDefault();
        }
        src.closest('[data-hide-parent]').addClass('hidden');
        return $('input', tgt.removeClass('hidden')).focus();
      }
    });
  });
}).call(this);
