document.addEventListener('DOMContentLoaded', function () {
    var elementsRouges = document.querySelectorAll('#rouge');
    var switchTheme = document.getElementById('switchTheme');
    var elementLogo = document.getElementById('imglogo');
    var monElement = document.querySelectorAll('.rougeHover');
    
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

      if (switchTheme.checked) {
        elementLogo.src = 'img/logovaloOmegajpg.png';

        elementsRouges.forEach(function (element) {
            element.style.backgroundColor = '#4362fe';
        });

        monElement.forEach(function (element2) {
            element2.addEventListener('mouseenter', function () {
                element2.style.backgroundColor = '#4362fe';
            });
            element2.addEventListener('mouseleave', function () {
                element2.style.backgroundColor = 'rgb(17, 17, 17)';
            });
        });

    } else {
        elementLogo.src = 'img/logovalojpg.png';
        elementsRouges.forEach(function (element) {
            element.style.backgroundColor = '#ff4655';
        });

        monElement.forEach(function (element2) {
            element2.addEventListener('mouseenter', function () {
                element2.style.backgroundColor = '#ff4655';
            });



            element2.addEventListener('mouseleave', function () {
                element2.style.backgroundColor = 'rgb(17, 17, 17)';
            });
        });
    }

    switchTheme.addEventListener('change', function () {
        if (switchTheme.checked) {
            elementLogo.src = 'img/logovaloOmegajpg.png';

            elementsRouges.forEach(function (element) {
                element.style.backgroundColor = '#4362fe';
            });

            monElement.forEach(function (element2) {
                element2.addEventListener('mouseenter', function () {
                    element2.style.backgroundColor = '#4362fe';
                });
                element2.addEventListener('mouseleave', function () {
                    element2.style.backgroundColor = 'rgb(17, 17, 17)';
                });
            });

        } else {
            elementLogo.src = 'img/logovalojpg.png';
            elementsRouges.forEach(function (element) {
                element.style.backgroundColor = '#ff4655';
            });

            monElement.forEach(function (element2) {
                element2.addEventListener('mouseenter', function () {
                    element2.style.backgroundColor = '#ff4655';
                });



                element2.addEventListener('mouseleave', function () {
                    element2.style.backgroundColor = 'rgb(17, 17, 17)';
                });
            });
        }
    });

    

});
