$(function() {
    $('.carousel').carousel({
        interval: 3000
    });

    $(".pagination").find("a").attr("data-remote", true);

    /* Scroll to top on select page */
    $(".pagination").find("a").click(function() {
        $('body').animate({
            scrollTop : $(".b-content__header").offset().top - 10
        },'slow');
    });

    /* Scroll to header login or signup form on link click */
    $(".b-menu__profile").find("a").click(function() {
        $('body').animate({
            scrollTop : $(".b-content__header").offset().top
        },'slow');
    });

    $('.b-menu__item .b-item__link').click(function() {
    	$('.b-menu__item .b-item__link').removeClass('b-item__link_active');
        $('.b-menu__profile > a').removeClass('b-item__link_active');
    	$(this).addClass('b-item__link_active');
    });

    $('.b-menu__profile > a').click(function() {
        $('.b-menu__item .b-item__link').removeClass('b-item__link_active');
        $('.b-menu__profile > a').removeClass('b-item__link_active');
        $(this).addClass('b-item__link_active');
    });
});