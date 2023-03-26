<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="css/details.css" type="text/css" rel="stylesheet" />
 <style type="text/css">
 
/*basic reset*/
* {margin: 0; padding: 0;}

html {
  height: 100%;
  /*Image only BG fallback*/
  
}

body {
  font-family: montserrat, arial, verdana;
    width: 100%;
  overflow-x: hidden;
}
/*form styles*/
.steps {
    width: 675px;
  margin: 50px auto;
  position: relative;
}

.steps fieldset {
  background: white;
  border: 0 none;
  border-radius: 3px;
  /*box-shadow: 0 17px 41px -21px rgb(0, 0, 0);*/
  padding: 20px 30px;
  box-sizing: border-box;
  width: 80%;
  margin: 0 10%;
  
  /*stacking fieldsets above each other*/
  position: absolute;
}
/*Hide all except first fieldset*/
.steps fieldset:not(:first-of-type) {
  display: none;
}
/*inputs*/
.steps label{
  text-align: left !important;
  font-size: 15px;
  font-weight: 200;
  padding-bottom: 7px;
  padding-top: 12px;
  display: inline-block;
}


.steps input, .steps textarea {
  outline: none;
  display: block;
  width: 100%;
  margin: 0 0 20px;
  padding: 10px 15px;
  border: 1px solid #d9d9d9;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  font-family: "Roboto";
  -webkti-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  font-size: 14px;
  font-wieght: 400;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
}

.steps input:focus, .steps textarea:focus{
  border: 1px solid #7B1FA2;
}

.error1{
   -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -moz-box-shadow: 0 0 0 transparent;
  -webkit-box-shadow: 0 0 0 transparent;
  box-shadow: 0 0 0 transparent;
  position: absolute;
  left: 525px;
  margin-top: -58px;
  padding: 0 10px;
  height: 39px;
  display: block;
  color: #ffffff;
  background: black;
  border: 0;
  font: 14px Corbel, "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", "Bitstream Vera Sans", "Liberation Sans", Verdana, "Verdana Ref", sans-serif;
  line-height: 39px;
  white-space: nowrap;

}

.error1:before{
    width: 0;
  height: 0;
  left: -8px;
  top: 14px;
  content: '';
  position: absolute;
  border-top: 6px solid transparent;
  border-right: 8px solid black;
  border-bottom: 6px solid transparent;
}

.error-log{
    margin: 5px 5px 5px 0;
  font-size: 19px;
  position: relative;
  bottom: -2px;
}

.question-log {
  margin: 5px 1px 5px 0;
  font-size: 15px;
  position: relative;
  bottom: -2px;
  }

/*buttons
.steps .action-button, .action-button {
  width: 100px !important;
  background: #7B1FA2;
  font-weight: bold;
  color: white;
  border: 0 none;
  border-color: balck;
  border-radius: 10px;
  cursor: pointer;
  padding: 10px 5px;
  margin: 10px auto;
  -webkit-transition: all 0.3s linear 0s;
  -moz-transition: all 0.3s linear 0s;
  -ms-transition: all 0.3s linear 0s;
  -o-transition: all 0.3s linear 0s;
  transition: all 0.3s linear 0s;
  display: block;
}*/

.steps .next, .steps .submit{
    float: right;
}

.steps .previous{
  float:left;
}

.steps .action-button:hover, .steps .action-button:focus, .action-button:hover, .action-button:focus {
}

.steps .explanation{
display: block;
  clear: both;
  width: 540px;
  position: relative;
  margin-left: -30px;
  padding: 22px 0px;
  margin-bottom: -10px;
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
  top: 10px;
  text-align: center;
  font-size: 12px;
  font-weight: 200;
  cursor:pointer;
}


/*headings*/
.fs-title {
  text-transform: uppercase;
     margin: 0 0 5px;
     line-height: 1;
     font-size: 18px;
    font-weight: 400;
    text-align:center;
}
.fs-subtitle {
  font-weight: normal;
  font-size: 13px;
  margin-bottom: 20px;
  text-align: center;
}
/*progressbar*/
#progressbar {
  margin-bottom: 30px;
  overflow: hidden;
  /*CSS counters to number the steps*/
  counter-reset: step;
  width:100%;
  text-align: center;
}
#progressbar li {
  list-style-type: none;
  text-transform: uppercase;
  font-size: 9px;
  width: 20%;
  float: left;
  position: relative;
}
#progressbar li:before {
  content: counter(step);
  counter-increment: step;
  width: 20px;
  line-height: 20px;
  display: block;
  font-size: 10px;
  background: white;
  border-radius: 3px;
  margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
  content: '';
  width: 100%;
  height: 2px;
  background: white;
  position: absolute;
  left: -50%;
  top: 9px;
  z-index: -1; /*put it behind the numbers*/
}
#progressbar li:first-child:after {
  /*connector not needed before the first step*/
  content: none; 
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before,  #progressbar li.active:after{
  color: white;
}


/* my modal */

.modal p{
  font-size: 15px;
  font-weight: 100;
  font-family: sans-serif;
  line-height: 21px;
}

.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  width: 50%;
  max-width: 630px;
  min-width: 320px;
  height: auto;
  z-index: 2000;
  visibility: hidden;
  -moz-backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -moz-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
.modal.modal-show {
  visibility: visible;
}
.lt-ie9 .modal {
  top: 0;
  margin-left: -315px;
}

.modal-content {
  position: relative;
  margin: 0 auto;
  padding: 40px;
  border-radius: 3px;
}

.modal-overlay {
  position: fixed;
  visibility: hidden;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 1000;
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
  opacity: 0;
  -moz-transition-property: visibility, opacity;
  -o-transition-property: visibility, opacity;
  -webkit-transition-property: visibility, opacity;
  transition-property: visibility, opacity;
  -moz-transition-delay: 0.5s, 0.1s;
  -o-transition-delay: 0.5s, 0.1s;
  -webkit-transition-delay: 0.5s, 0.1s;
  transition-delay: 0.5s, 0.1s;
  -moz-transition-duration: 0, 0.5s;
  -o-transition-duration: 0, 0.5s;
  -webkit-transition-duration: 0, 0.5s;
  transition-duration: 0, 0.5s;
}
.modal-show .modal-overlay {
  visibility: visible;
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=60);
  opacity: 0.6;
  -moz-transition: opacity 0.5s;
  -o-transition: opacity 0.5s;
  -webkit-transition: opacity 0.5s;
  transition: opacity 0.5s;
}

/*slide*/
.modal[data-modal-effect|=slide] .modal-content {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
  opacity: 0;
  -moz-transition: all 0.5s 0;
  -o-transition: all 0.5s 0;
  -webkit-transition: all 0.5s 0;
  transition: all 0.5s 0;
}
.modal[data-modal-effect|=slide].modal-show .modal-content {
  filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
  opacity: 1;
  -moz-transition: all 0.5s 0.1s;
  -o-transition: all 0.5s 0.1s;
  -webkit-transition: all 0.5s;
  -webkit-transition-delay: 0.1s;
  transition: all 0.5s 0.1s;
}
.modal[data-modal-effect=slide-top] .modal-content {
  -moz-transform: translateY(-300%);
  -ms-transform: translateY(-300%);
  -webkit-transform: translateY(-300%);
  transform: translateY(-300%);
}
.modal[data-modal-effect=slide-top].modal-show .modal-content {
  -moz-transform: translateY(0);
  -ms-transform: translateY(0);
  -webkit-transform: translateY(0);
  transform: translateY(0);
}


/* RESPONSIVE */

/* moves error logs in tablet/smaller screens */

@media (max-width:1000px){

/*brings inputs down in size */
.steps input, .steps textarea {
  outline: none;
  display: block;
  width: 100% !important;
  }

  /*brings errors in */
  .error1 {
  left: 345px;
  margin-top: -58px;
}




}


@media (max-width:675px){
/*mobile phone: uncollapse all fields: remove progress bar*/

.steps {
  width: 100%;
  margin: 50px auto;
  position: relative;
}

#progressbar{
  display:none;
}

/*move error logs */
.error1 {
  position: relative;
  left: 0 !important;
  margin-top: 24px;
  top: -11px;
}

.error1:before {
  width: 0;
  height: 0;
  left: 14px;
  top: -14px;
  content: '';
  position: absolute;
  border-left: 6px solid transparent;
  border-bottom: 8px solid;
  border-right: 6px solid transparent;
  }

/*show hidden fieldsets */
.steps fieldset:not(:first-of-type) {
  display: block;
}

.steps fieldset{
  position:relative;
  width: 100%;
  margin:0 auto;
  margin-top: 45px;
}

.steps .next, .steps .previous{
  display:none;
}

.steps .explanation{
  display:none;
}

.steps .submit {
  float: right;
  margin: 28px auto 10px;
  width: 100% !important;
}

}



/* Info */
.info {
  width: 300px;
  margin: 35px auto;
  text-align: center;
  font-family: 'roboto', sans-serif;
}

.info h1 {
  margin: 0;
  padding: 0;
  font-size: 28px;
  font-weight: 400;
  padding-bottom: 5px;
  margin-left: 10px;]

}
.info span {
  font-size: 13px;
  margin-top:20px;
}
.info span a {
  text-decoration: none;
}
.info span .fa {
  color: rgb(226, 168, 16);
  font-size: 19px;
  position: relative;
  left: -2px;
}

.info span .spoilers {
  margin-top: 5px;
  font-size: 10px;
}
html {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
}
 </style>
</head>
<body>
	


<!-- Modal -info -->


<form id="details" method="post" action="complete_registration" class="steps" >
 

  <!-- ACQUISITION FIELD SET -->  
  <fieldset>
   		<h1 style="margin-left: 19%">Enter Your Details</h1>
        <div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1">
        
          <input class="form-text hs-input" name="Name" required="required"type="text" value="" placeholder="Enter your name here" data-rule-required="true" data-msg-required="Please enter Your Name">
          
          <span class="error1" style="display: none;">
              <i class="error-log fa fa-exclamation-triangle"></i>
          </span>
        </div>
     <div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1">
        
         

          <input class="form-text hs-input" name="Number" required="required"type="text" value="" placeholder="Enter Your Phone Number here" data-rule-required="true" data-msg-required="Please enter Your Phone Number">
          
          <span class="error1" style="display: none;">
              <i class="error-log fa fa-exclamation-triangle"></i>
          </span>
        </div>
        
    <input type="button" data-page="2" name="next" class="next action-button" value="Next" />
  </fieldset>



  <!-- Cultivation FIELD SET -->  
  <fieldset>
    	<h3> Selected Flight Details </h3>
    		<input type="hidden" name="id" value="${flight_details.id}">
			<input type="hidden" name="paid" value="${nop * flight_details.price}">
			<div style='position: relative;left: 43%;' >
			<table border=1>
				<tr>
					<td>Date</td>
					<td>${flight_details.dates}</td>
				</tr>
				<tr>
					<td>Airlines</td>
					<td>${flight_details.company}</td>
				</tr>
				<tr>
					<td>Source</td>
					<td>${flight_details.source}</td>
				</tr>
				<tr>
					<td>Destination</td>
					<td>${flight_details.destination}</td>
				</tr>
			</table>
			
			</div>
			<br>
			<br>
      <!-- Begin Average Gift Size in Year 1 Field -->
<%--       <c:forEach var="flight" items="${flights__}"> --%>
<!--        <div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1"> -->
        
<!--           <label for="edit-submitted-acquisition-amount-1 total_number_of_donors_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">Source :</label> -->

<%--           <input class="" name="Source" required="required"type="text" value="${flight.source} " placeholder="" data-rule-required="true" data-msg-required=""> <input class="" name="Flight_id" type="hidden" value="${flight.id} "> --%>
<!--           <span class="error1" style="display: none;"> -->
<!--               <i class="error-log fa fa-exclamation-triangle"></i> -->
<!--           </span> -->
<!--         </div> -->
<!--      <div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1"> -->
        
<!--           <label for="edit-submitted-acquisition-amount-1 total_number_of_donors_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">Destination</label> -->

<%--           <input class="form-text hs-input" name="Destination" required="required"type="text" value="${flight.destination}"> --%>
          
<!--           <span class="error1" style="display: none;"> -->
<!--               <i class="error-log fa fa-exclamation-triangle"></i> -->
<!--           </span> -->
<!--         </div><div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1"> -->
        
<!--           <label for="edit-submitted-acquisition-amount-1 total_number_of_donors_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">Airline</label> -->

<%--           <input class="form-text hs-input" name="airline" required="required"type="text" value="${flight.name}" > --%>
          
<!--           <span class="error1" style="display: none;"> -->
<!--               <i class="error-log fa fa-exclamation-triangle"></i> -->
<!--           </span> -->
<!--         </div> -->
<!--         <div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1"> -->
        
<!--           <label for="edit-submitted-acquisition-amount-1 total_number_of_donors_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">Date</label> -->

<%--           <input class="form-text hs-input" name="Date" type="text" value="${date}"> --%>
<!--           <span class="error1" style="display: none;"> -->
<!--               <i class="error-log fa fa-exclamation-triangle"></i> -->
<!--           </span> -->
<!--         </div> -->
<!--         <div class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field" id="webform-component-acquisition--amount-1"> -->
        
<%--           <label for="edit-submitted-acquisition-amount-1 total_number_of_donors_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">Price( ${no_of_persons}-Tickets) </label> --%>

<%--           <input class="form-text hs-input" name="Total" type="text" value="${Total}"> --%>
<!--           <span class="error1" style="display: none;"> -->
<!--               <i class="error-log fa fa-exclamation-triangle"></i> -->
<!--           </span> -->
<!--         </div> -->
<%--         </c:forEach> --%>
        <!-- End Average Gift Size Perchent Change Field -->
    <input type="button" data-page="3" name="previous" class="previous action-button" value="Previous" />
    <input type="button" data-page="3" name="next" class="next action-button" value="Next" />
  </fieldset>



  <!-- Cultivation2 FIELD SET --> 
  <fieldset style="left: 6%;
    position: relative;">
   <h3 class="fs-subtitle">Payment Page</h3>
   <img alt="" src="img/flight.jpg">
      <strong>Ticket Price :  Rs${flight_details.price}/- <br>No of Persons : ${nop} <br>Total Price : Rs:${flight_details.price}/- x ${nop}= Rs:${nop*flight_details.price }/-   </strong>
           <input type="text"  name="upi_id"  placeholder="Enter UPI_ID here to pay [you can't proceed without this]" required/>
           <input type="button" data-page="3" name="previous" class="previous action-button" value="Previous" />
		   <input type="submit" value="Pay Now" />
   </fieldset>


</form>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
  <script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
  <script type="text/javascript" src="css/details.js"> </script>
  <script>
    

$(document).ready(function() {
  var current_fs, next_fs, previous_fs;
  var left, opacity, scale;
  var animating;
  $(".steps").validate({
      errorClass: 'invalid',
      errorElement: 'span',
      errorPlacement: function(error, element) {
          error.insertAfter(element.next('span').children());
      },
      highlight: function(element) {
          $(element).next('span').show();
      },
      unhighlight: function(element) {
          $(element).next('span').hide();
      }
  });
  $(".next").click(function() {
      $(".steps").validate({
          errorClass: 'invalid',
          errorElement: 'span',
          errorPlacement: function(error, element) {
              error.insertAfter(element.next('span').children());
          },
          highlight: function(element) {
              $(element).next('span').show();
          },
          unhighlight: function(element) {
              $(element).next('span').hide();
          }
      });
      if ((!$('.steps').valid())) {
          return true;
      }
      if (animating) return false;
      animating = true;
      current_fs = $(this).parent();
      next_fs = $(this).parent().next();
      $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
      next_fs.show();
      current_fs.animate({
          opacity: 0
      }, {
          step: function(now, mx) {
              scale = 1 - (1 - now) * 0.2;
              left = (now * 50) + "%";
              opacity = 1 - now;
              current_fs.css({
                  'transform': 'scale(' + scale + ')'
              });
              next_fs.css({
                  'left': left,
                  'opacity': opacity
              });
          },
          duration: 800,
          complete: function() {
              current_fs.hide();
              animating = false;
          },
          easing: 'easeInOutExpo'
      });
  });
  $(".submit").click(function() {
      $(".steps").validate({
          errorClass: 'invalid',
          errorElement: 'span',
          errorPlacement: function(error, element) {
              error.insertAfter(element.next('span').children());
          },
          highlight: function(element) {
              $(element).next('span').show();
          },
          unhighlight: function(element) {
              $(element).next('span').hide();
          }
      });
      if ((!$('.steps').valid())) {
          return false;
      }
      if (animating) return false;
      animating = true;
      current_fs = $(this).parent();
      next_fs = $(this).parent().next();
      $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
      next_fs.show();
      current_fs.animate({
          opacity: 0
      }, {
          step: function(now, mx) {
              scale = 1 - (1 - now) * 0.2;
              left = (now * 50) + "%";
              opacity = 1 - now;
              current_fs.css({
                  'transform': 'scale(' + scale + ')'
              });
              next_fs.css({
                  'left': left,
                  'opacity': opacity
              });
          },
          duration: 800,
          complete: function() {
              current_fs.hide();
              animating = false;
          },
          easing: 'easeInOutExpo'
      });
  });
  $(".previous").click(function() {
      if (animating) return false;
      animating = true;
      current_fs = $(this).parent();
      previous_fs = $(this).parent().prev();
      $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
      previous_fs.show();
      current_fs.animate({
          opacity: 0
      }, {
          step: function(now, mx) {
              scale = 0.8 + (1 - now) * 0.2;
              left = ((1 - now) * 50) + "%";
              opacity = 1 - now;
              current_fs.css({
                  'left': left
              });
              previous_fs.css({
                  'transform': 'scale(' + scale + ')',
                  'opacity': opacity
              });
          },
          duration: 800,
          complete: function() {
              current_fs.hide();
              animating = false;
          },
          easing: 'easeInOutExpo'
      });
  });
});
jQuery(document).ready(function() {
  jQuery("#edit-submitted-acquisition-amount-1,#edit-submitted-acquisition-amount-2,#edit-submitted-cultivation-amount-1,#edit-submitted-cultivation-amount-2,#edit-submitted-cultivation-amount-3,#edit-submitted-cultivation-amount-4,#edit-submitted-retention-amount-1,#edit-submitted-retention-amount-2,#edit-submitted-constituent-base-total-constituents").keyup(function() {
      calcTotal();
  });
});

var modules = {
  $window: $(window),
  $html: $('html'),
  $body: $('body'),
  $container: $('.container'),
  init: function() {
      $(function() {
          modules.modals.init();
      });
  },
  modals: {
      trigger: $('.explanation'),
      modal: $('.modal'),
      scrollTopPosition: null,
      init: function() {
          var self = this;
          if (self.trigger.length > 0 && self.modal.length > 0) {
              modules.$body.append('<div class="modal-overlay"></div>');
              self.triggers();
          }
      },
      triggers: function() {
          var self = this;
          self.trigger.on('click', function(e) {
              e.preventDefault();
              var $trigger = $(this);
              self.openModal($trigger, $trigger.data('modalId'));
          });
          $('.modal-overlay').on('click', function(e) {
              e.preventDefault();
              self.closeModal();
          });
          modules.$body.on('keydown', function(e) {
              if (e.keyCode === 27) {
                  self.closeModal();
              }
          });
          $('.modal-close').on('click', function(e) {
              e.preventDefault();
              self.closeModal();
          });
      },
      openModal: function(_trigger, _modalId) {
          var self = this,
              scrollTopPosition = modules.$window.scrollTop(),
              $targetModal = $('#' + _modalId);
          self.scrollTopPosition = scrollTopPosition;
          modules.$html.addClass('modal-show').attr('data-modal-effect', $targetModal.data('modal-effect'));
          $targetModal.addClass('modal-show');
          modules.$container.scrollTop(scrollTopPosition);
      },
      closeModal: function() {
          var self = this;
          $('.modal-show').removeClass('modal-show');
          modules.$html.removeClass('modal-show').removeAttr('data-modal-effect');
          modules.$window.scrollTop(self.scrollTopPosition);
      }
  }
}
modules.init();
            function myFunction() {
                document.getElementById("details").submit();
            }
        </script>
</body>
</html>