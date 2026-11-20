jQuery.noConflict();

(function($) {
	$(document).ready(function() {

		$(".btn.switchLinkText").on("click", function() {
			$(this).toggleClass("btn-secondary").toggleClass("btn-outline-secondary");

			var myID = $(this).data("href");
			$(myID).trigger("click").parent().toggleClass("iVisible").slideToggle();

			if ($("#Form_ShopForm_Products input:checked").length > 0) {
				$("#shopFormHolder").slideDown();
			} else {
				$("#shopFormHolder").slideUp();
			}
		});

		$("#Form_ShopForm_Products > li label").on("click", function(e) {
			e.preventDefault();
		});

		$(".updateid a").each(function() {
			$(this).attr("data-fancybox", $(this).parent().data("id"));
		});

		$(".hamburger").click(function() {
			$(".hamburger").toggleClass("is-active");
			$("#mobileMenu").toggleClass("is-active");
		});

		$("#mobileMenu .arrow").on("click", function() {
			var myHolder = $(this).parent();
			myHolder.toggleClass("active");
		});

		$("input[type=submit]").addClass("btn btn-primary btn-block");

		$('.lazy-slider').each(function() {
			var $ajaxCarousel = $(this);
			if ($ajaxCarousel.length > 0) {
			    $ajaxCarousel.on('slide.bs.carousel', function (e) {
			        var $upcomingImage = $(e.relatedTarget).find('picture');
			        $upcomingImage.children().each(function() {
			        	if (typeof $(this).attr('src') === 'undefined' && typeof $(this).attr('srcset') === 'undefined') {
				            $(this).attr('src', $(this).data('src'));
				            $(this).attr('srcset', $(this).data('srcset'));
				        }
			        });
			    });
			}
		});

		setTimeout(function() {
			$(".lazy-picture").each(function() {
				var $myImg = $(this);
				$myImg.children().each(function() {
		        	if (typeof $(this).attr('src') === 'undefined' && typeof $(this).attr('srcset') === 'undefined') {
			            $(this).attr('src', $(this).data('src'));
			            $(this).attr('srcset', $(this).data('srcset'));
			        }
		        });
			});
		}, 500);

		AOS.init({
			// Global settings:
			disable: false, // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
			startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
			initClassName: 'aos-init', // class applied after initialization
			animatedClassName: 'aos-animate', // class applied on animation
			useClassNames: false, // if true, will add content of `data-aos` as classes on scroll
			disableMutationObserver: false, // disables automatic mutations' detections (advanced)
			debounceDelay: 50, // the delay on debounce used while resizing window (advanced)
			throttleDelay: 99, // the delay on throttle used while scrolling the page (advanced)


			// Settings that can be overridden on per-element basis, by `data-aos-*` attributes:
			offset: 120, // offset (in px) from the original trigger point
			delay: 0, // values from 0 to 3000, with step 50ms
			duration: 800, // values from 0 to 3000, with step 50ms
			easing: 'ease', // default easing for AOS animations
			once: false, // whether animation should happen only once - while scrolling down
			mirror: false, // whether elements should animate out while scrolling past them
			anchorPlacement: 'top-bottom', // defines which position of the element regarding to window should trigger the animation

		});
	});
}(jQuery));
