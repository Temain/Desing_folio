$(function() {
    $('.b-menu_item .b-item_link').click(function() {
    	$('.b-menu_item .b-item_link').removeClass('b-item_link_active');
    	$(this).addClass('b-item_link_active');
    });
});