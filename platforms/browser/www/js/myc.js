$$(document).on('click', '#container1 .support-selection', function openInfo(event) {
    console.log(event.target.className);
    if (event.target.className.includes("support-selection")) {
        var otherDivs = document.getElementsByClassName("support-info");
        for (var i = 0; i < otherDivs.length; i++) {
            otherDivs[i].style.display = "none";
        }
        //document.getElementById(event.target.parentNode.id).childNodes[1].style.display = "block";
        $('.content-block #container1 '+'#'+event.target.parentNode.id).children().css("display","block");
    }
});
