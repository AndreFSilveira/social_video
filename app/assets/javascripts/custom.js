$(document).on('ready page:load', function () {
    $(".button-collapse").sideNav();
    $(".dropdown-button").dropdown();
    $('select').material_select();
    $('.parallax').parallax();
    $(".select.optional.initialized").select2();

    $("#news_search input#search").keyup(function(){
        $.get($("#news_search").attr("action"), $("#news_search").serialize(), null,"script");
        event.preventDefault()
        return false
    });
});


