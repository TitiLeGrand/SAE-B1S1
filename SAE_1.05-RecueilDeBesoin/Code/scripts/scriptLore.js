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



    if (switchTheme.checked) {
        textesRouges.forEach(function (element) {element.style.color = '#4362fe';});
    }

    else {
        textesRouges.forEach(function (element) {element.style.color = '#ff4655'})
    }




    
    switchTheme.addEventListener('change', function () {
        if (switchTheme.checked) {
            textesRouges.forEach(function (element) {element.style.color = '#4362fe';});
        }
    
        else {
            textesRouges.forEach(function (element) {element.style.color = '#ff4655'})
        }
    })
})

