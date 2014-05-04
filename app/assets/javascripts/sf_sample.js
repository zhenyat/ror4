$(document).ready(function(){
    $("ul.sf-menu").superfish({
        animation: {opacity:'show', height:'show'},  // slide-down effect without fade-in
        speed: 'normal',                             // animation speed
        delay:  800,                                 // delay in msec on mouseout
        autoArrows:  true,                           // on submenu arrow стрелку подменю (substitutes class="sf-sub-indicator")
        dropShadows: false                           // off shadow
    });
});
