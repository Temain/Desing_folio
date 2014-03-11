$(function() {
    $(".pagination").find("a").attr("data-remote", true);

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