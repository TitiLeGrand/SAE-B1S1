document.addEventListener('DOMContentLoaded', function () {

    var textesRouges = document.querySelectorAll('.rougeTexte');
    var switchTheme = document.getElementById('switchTheme');
    

    //Stockage et rétablissement de la valeur du switch de thème

    var savedSwitchTheme = localStorage.getItem('switchThemeState');
    switchTheme.addEventListener('change', function (){
        localStorage.setItem('switchThemeState', switchTheme.checked);
    })

    if (savedSwitchTheme === 'true') {
        switchTheme.checked = true;
      } else {
        switchTheme.checked = false;
      }

// Agents
    var declencheurMove = document.querySelectorAll('.declencheurMove');
    var text = document.querySelectorAll('.textToMove');
    var img = document.querySelector('.imgToZoomAgents');
    var sBCKGagents = document.getElementById('selectedBackgroundAgentsImg')

// Armes
    var text2 = document.querySelector('.text2ToMove');
    var imgArmes = document.querySelector('.imgArmes');
    var declencheurMove2 = document.querySelector('.armesBox');
    var sBCKGarmes = document.getElementById('selectedBackgroundArmesImg');

// Maps
    var declencheurMove3 = document.getElementById('mapsBox');
    var text3 = document.querySelector('.textToMove3');
    var imgMaps = document.querySelector('.imgToZoomMaps');
    var sBCKGmaps = document.getElementById('selectedBackgroundMapsImg');

// Ranks
    var declencheurMove4 = document.getElementById('ranksBox');
    var text4 = document.querySelector('.text4ToMove');
    var imgRanks = document.getElementById('imgToZoomRanks');
    var sBCKGranks = document.getElementById('selectedBackgroundRanksImg');

// Lore    
    var declencheurMove5 = document.getElementById('loreBox');
    var text5 = document.querySelector('.text5ToMove');
    var imgLore = document.querySelector('.imgToZoomLore');
    var sBCKGlore = document.getElementById('selectedBackgroundLoreImg');

// Image de l'animation de séléction d'une catégorie
    var sBCKG = document.querySelectorAll('.selectedBackgroundStyle');

// Initialistion de l'emplacement des images et du texte pour les animations

    text.forEach(function (toMove) {
        toMove.style.transform = 'translateX(-50px)';
    });

    text2.style.transform = 'translateX(40px)';
    text3.style.transform = 'translateX(-50px)';
    text4.style.transform = 'translateX(40px)';
    text5.style.transform = 'translateX(-50px)';
    sBCKGagents.style.transform = 'translateX(-100%)';
    sBCKGarmes.style.transform = 'translateX(100%)';
    sBCKGmaps.style.transform = 'translateX(-100%)';
    sBCKGranks.style.transform = 'translateX(100%)';
    sBCKGlore.style.transform = 'translateX(-100%)';

    //texte mouse in 1
    declencheurMove.forEach(function (element2) {
        element2.addEventListener('mouseenter', function () {
            text.forEach(function (toMove) {
                toMove.style.transform = 'translateX(200px) scale(120%)';
                toMove.style.transition = '0.2s';

                sBCKGagents.style.transform = 'translateX(0%)';

            })
            //img mouse in 1         

            img.style.transform = 'scale(120%)';
            img.style.filter = 'drop-shadow(inset 0px 0px 10px black)';




        });
        //text mouse out 1
        element2.addEventListener('mouseleave', function () {
            text.forEach(function (toMove) {
                toMove.style.transform = 'translateX(-50px)';
                toMove.style.transition = '0.2s';
            })
            //img mouse out 1

            img.style.transform = 'scale(100%)';
            img.style.filter = 'drop-shadow(inset 0px 0px 0px black)';
            sBCKGagents.style.transform = 'translateX(-100%)';




        });
    });

//Switch Theme

    if (switchTheme.checked) {
        textesRouges.forEach(function (element) {
            element.style.color = '#4362fe';
        });

        text3.style.color = '#4362fe'; // Change color for maps
    text4.style.color = '#4362fe'; // Change color for ranks
    text5.style.color = '#4362fe'; // Change color for lore
    
        img.style.filter = 'invert(1)';
        imgArmes.style.filter = 'invert(1)';
        imgMaps.style.filter = 'invert(1)';
        imgRanks.style.filter = 'invert(1)';
        imgLore.style.filter = 'invert(1)';

        sBCKG.forEach(function(element) {
            element.src = 'img/selectedBackgroundOmega.png';
        });
    }

    else {

        textesRouges.forEach(function (element) {
            element.style.color = '#ff4655';
        });

        text3.style.color = '#ff4655'; // Change color for maps
    text4.style.color = '#ff4655'; // Change color for ranks
    text5.style.color = '#ff4655'; // Change color for lore

        img.style.filter = 'invert(0)';
        imgArmes.style.filter = 'invert(0)';
        imgMaps.style.filter = 'invert(0)';
        imgRanks.style.filter = 'invert(0)';
        imgLore.style.filter = 'invert(0)';

        sBCKG.forEach(function(element) {
            element.src = 'img/selectedBackground.png';
        });

    }

    switchTheme.addEventListener('change', function () {
        if (switchTheme.checked) {
            textesRouges.forEach(function (element) {
                element.style.color = '#4362fe';
            });

            text3.style.color = '#4362fe'; // Change color for maps
    text4.style.color = '#4362fe'; // Change color for ranks
    text5.style.color = '#4362fe'; // Change color for lore

            img.style.filter = 'invert(1)';
            imgArmes.style.filter = 'invert(1)';
            imgMaps.style.filter = 'invert(1)';
            imgRanks.style.filter = 'invert(1)';
            imgLore.style.filter = 'invert(1)';

            sBCKG.forEach(function(element) {
                element.src = 'img/selectedBackgroundOmega.png';
            });
        }

        else {

            textesRouges.forEach(function (element) {
                element.style.color = '#ff4655';
            });

            text3.style.color = '#ff4655'; // Change color for maps
    text4.style.color = '#ff4655'; // Change color for ranks
    text5.style.color = '#ff4655'; // Change color for lore

            img.style.filter = 'invert(0)';
            imgArmes.style.filter = 'invert(0)';
            imgMaps.style.filter = 'invert(0)';
            imgRanks.style.filter = 'invert(0)';
            imgLore.style.filter = 'invert(0)';

            sBCKG.forEach(function(element) {
                element.src = 'img/selectedBackground.png';
            });

        }
    });

// Mouse in, armes
    declencheurMove2.addEventListener('mouseenter', function () {
        imgArmes.style.transform = 'scale(120%)';
        text2.style.transform = 'translateX(-200px) scale(120%)';
        sBCKGarmes.style.transform = 'translateX(0%)';


    });

// Mouse out, armes
    declencheurMove2.addEventListener('mouseleave', function () {
        text2.style.transform = 'translateX(40px)';
        imgArmes.style.transform = 'scale(100%)';
        sBCKGarmes.style.transform = 'translateX(100%)';


    });

// Mouse in, maps
    declencheurMove3.addEventListener('mouseenter', function () {
        imgMaps.style.transform = 'scale(120%)';
        text3.style.transform = 'translateX(200px) scale(120%)';
        sBCKGmaps.style.transform = 'translateX(0%)';

    });

// Mouse out, maps
    declencheurMove3.addEventListener('mouseleave', function () {
        text3.style.transform = 'translateX(-50px)';
        imgMaps.style.transform = 'scale(100%)';
        sBCKGmaps.style.transform = 'translateX(-100%)';

    });

// Mouse in, ranks
    declencheurMove4.addEventListener('mouseenter', function () {
        imgRanks.style.transform = 'scale(120%)';
        text4.style.transform = 'translateX(-200px) scale(120%)';
        sBCKGranks.style.transform = 'translateX(0%)';

    });

// Mouse out, ranks
    declencheurMove4.addEventListener('mouseleave', function () {
        text4.style.transform = 'translateX(40px)';
        imgRanks.style.transform = 'scale(100%)';
        sBCKGranks.style.transform = 'translateX(100%)';

    });

// Mouse in, lore
    declencheurMove5.addEventListener('mouseenter', function () {
        imgLore.style.transform = 'scale(120%)';
        text5.style.transform = 'translateX(200px) scale(120%)';
        sBCKGlore.style.transform = 'translateX(0%)';

    });

// Mouse out, lore
    declencheurMove5.addEventListener('mouseleave', function () {
        text5.style.transform = 'translateX(-50px)';
        imgLore.style.transform = 'scale(100%)';
        sBCKGlore.style.transform = 'translateX(-100%)';

    });


});
