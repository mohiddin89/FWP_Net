/*!
*	Theme Name 		  : FITMATE
* Description		  : FITMATE is Fitness Studio Bootstrap Template designed for fitness clubs, Fitness Studio, Small gyms, individual Trainers, yoga studio, etc for fitness business to showcase their courses & services.
* Framework Type 	: Bootstrap
*	Author 			    : UIGRID
*	Author Profile 	: http://www.uigrid.com/
* Author Email 	  : gridthemes@gmail.com
*	Version 		    : 1.0
*/


/*--------------------------------------------------------------
  TABLE OF CONTENTS:
----------------------------------------------------------------
1.	Preloader - Loading animation
2.	Main Navigation - Smooth scroll
    Main Navigation - On Scroll Add - Remove Class 
    Add Offset for body to offset - Bootstrap data-spy

3.  Slick slider - Explore Classes
4.  Trainers Carousel - slick.js
5.  Video Popup
6.  Testimonial slider - slick.js
7.  Gallery - magnific-popup.min.js
8.  Parallax - paroller.js
9.  Contact form - AJAX
-------------------------------------------------------------------*/


(function($) {

  // Use strict start
    "use strict";

  // Selectors 
  var $window = $(window),
      $body = $('body'),
      $navbar_toggle = $('.navbar-toggle'),
      $navbar_toggle_menu = $('.mobile-menu li a'),
      $course_list = $('.course_list'),
      $trainer_wrap = $('.trainer_wrap'),
      $popup_youtube = $('.popup_youtube'),
      $testimonial_list = $('.testimonial_list'),
      $gallery_wrap = $('.gallery_wrap'),
      $parallax = $('.parallax'),
      $offer = $('.offer'),
      $testimonial_box = $('.testimonial_box');



  /*--------------------------------------------------------------
  1.  Preloader - Loading animation
  --------------------------------------------------------------*/
	$window.load(function() { // makes sure the whole site is loaded
		$('#Status').fadeOut(); // will first fade out the loading animation 
		$('#Preloader').delay(350).fadeOut(); // will fade out the white DIV that covers the website. 
		$('body').delay(350).css({'overflow':'visible'});
	});


  /*--------------------------------------------------------------
  2.  Main Navigation - Smooth scroll
  --------------------------------------------------------------*/
  $('a[href*="#"]:not([href="#"]):not(a[data-toggle="collapse"], a[data-toggle="tab"])').on('click', function () {
    var offset = -68;
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name' + this.hash.slice(1) + ']');
        if (target.length) {
            $('html, body').animate({
                scrollTop: target.offset().top + offset
            }, 800);
            return false;
        }
    }
  });

  /*--------------------------------------------------------------
  #  Main Navigation - On Scroll Add - Remove Class 
  --------------------------------------------------------------*/
  $window.scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll >= 70) {
      // Add Class Sticky to Navbar
      $("#Navigation").addClass("sticky");
    }
    else{
      // Remove Class Sticky from Navbar
      $("#Navigation").removeClass("sticky");      
    }

  });


  /*--------------------------------------------------------------
  #  Mobile Menu button 
  --------------------------------------------------------------*/
  $navbar_toggle.on('click', function(e) {
    $(this).toggleClass('menu_active');
  });

  /*--------------------------------------------------------------
  #  Mobile Menu button 
  --------------------------------------------------------------*/
  $navbar_toggle_menu.on('click', function(e) {
    $('.navbar-collapse').toggleClass('in');
  });


  /*--------------------------------------------------------------
  #  Add Offset for body to offset - Bootstrap data-spy
  --------------------------------------------------------------*/
  $body.scrollspy({ offset: 80 });


  /*--------------------------------------------------------------
  3.  Slick slider - Explore Classes
  --------------------------------------------------------------*/
  $course_list.slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    adaptiveHeight: true,
    prevArrow: '<div class="slick-prev slick-nav-btn"><i class="fa fa-angle-left fa-3x"></i></div>',
    nextArrow: '<div class="slick-next slick-nav-btn"><i class="fa fa-angle-right fa-3x"></i></div>',
    // Responsive Breakpoints for Mobile & Tablets
    responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 2,
            adaptiveHeight: true,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            adaptiveHeight: true,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            adaptiveHeight: true,
          }
        }
    ]
  });


  /*--------------------------------------------------------------
  4.  Trainers Carousel - slick.js
  --------------------------------------------------------------*/
  $trainer_wrap.slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 4000,
    prevArrow: '<div class="slick-prev slick-nav-btn"><i class="fa fa-angle-left fa-3x"></i></div>',
    nextArrow: '<div class="slick-next slick-nav-btn"><i class="fa fa-angle-right fa-3x"></i></div>',
    // Responsive Breakpoints for Mobile & Tablets
    responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 2,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
          }
        }
    ]
  });


  /*--------------------------------------------------------------
  5.  Video Popup - magnific-popup.min.js
  --------------------------------------------------------------*/
  $popup_youtube.magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,
    fixedContentPos: false
  });


  /*--------------------------------------------------------------
  6.  Testimonial slider - slick.js
  --------------------------------------------------------------*/
  $testimonial_list.slick({
    slidesToShow: 2,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 4000,
    prevArrow: '<div class="slick-prev slick-nav-btn"><i class="fa fa-angle-left fa-3x"></i></div>',
    nextArrow: '<div class="slick-next slick-nav-btn"><i class="fa fa-angle-right fa-3x"></i></div>',
    // Responsive Breakpoints for Mobile & Tablets
    responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 2,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
          }
        }
    ]
  });



  /*--------------------------------------------------------------
  7.  Gallery - magnific-popup.min.js
  --------------------------------------------------------------*/
  $gallery_wrap.magnificPopup({
    delegate: 'a',
    type: 'image',
    tLoading: 'Loading image #%curr%...',
    mainClass: 'mfp-img-mobile',
    gallery: {
      enabled: true,
      navigateByImgClick: true,
      preload: [0,1] // Will preload 0 - before current, and 1 after the current image
    },
    image: {
      tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
    }
  });



  /*--------------------------------------------------------------
  8.  Parallax - paroller.js
  --------------------------------------------------------------*/
  $parallax.paroller();
  $offer.paroller();
  $testimonial_box.paroller();



  /*--------------------------------------------------------------
  9.  Contact form - AJAX
  --------------------------------------------------------------*/
  // Assigned form
  var form = $('#ajax-contact');

  // Messages div
  var formMessages = $('#form-messages');

  // Set up an event listener for the contact form.
  $(form).submit(function(e) {
    // Stop the browser from submitting the form.
    e.preventDefault();

    // Serialize the form data.
    var formData = $(form).serialize();

    // Submit the form using AJAX
    $.ajax({
      type: 'POST',
      url: $(form).attr('action'),
      data: formData
    })
    .done(function(response) {
      // Make sure that the formMessages div has the 'success' class.
      $(formMessages).removeClass('error');
      $(formMessages).addClass('success');

      // Set the message text.
      $(formMessages).text(response);

      // Clear the form.
      $('#name').val('');
      $('#email').val('');
      $('#message').val('');
    })
    .fail(function(data) {
      // Make sure that the formMessages div has the 'error' class.
      $(formMessages).removeClass('success');
      $(formMessages).addClass('error');

      // Set the message text.
      if (data.responseText !== '') {
        $(formMessages).text(data.responseText);
      } else {
        $(formMessages).text('Oops! An error occured and your message could not be sent.');
      }
    });

  });


})(jQuery); // Use strict end