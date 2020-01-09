let active = false;

$(function () {
    $(".accordion").accordion();
});
$('.accordion').accordion({
    active: false,
    collapsible: true,
    heightStyle: "content",
});

$(".accordion").click(function () {
    $("#folder" + active).switchClass("fa-folder-open", "fa-folder");
    active = $(".accordion").accordion("option", "active");
    $("#folder" + active).switchClass("fa-folder", "fa-folder-open");
});