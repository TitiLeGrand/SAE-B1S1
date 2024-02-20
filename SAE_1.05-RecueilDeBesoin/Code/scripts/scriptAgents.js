document.addEventListener('DOMContentLoaded', function () {
    var roleAgent = '';
    var abilitiesButtons = [];
    var modals = [];

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

    fetch('https://valorant-api.com/v1/agents?language=fr-FR&isPlayableCharacter=true')
        .then(res => {
            if (!res.ok) {
                throw new Error(`HTTP error! Status: ${res.status}`);
            }
            return res.json();
        })
        .then(response => response.data)
        .then(data => {
            data.forEach(agent => {
                if (agent) {
                    if (agent.role.displayName == 'Initiateur') {
                        roleAgent = 'roleInitiateur';
                    } else if (agent.role.displayName == 'Sentinelle') {
                        roleAgent = 'roleSentinelle';
                    } else if (agent.role.displayName == 'Contrôleur') {
                        roleAgent = 'roleControleur';
                    } else if (agent.role.displayName == 'Duelliste') {
                        roleAgent = 'roleDuelliste';
                    }

                    var tabAbilitiesDisplayIcon = [];
                    var tabAbilitiesDescription = [];
                    agent.abilities.forEach(abilities => {
                        tabAbilitiesDisplayIcon.push(`${abilities.displayIcon}`);
                        tabAbilitiesDescription.push(`${abilities.description}`);

                    })

                    const abilitiesButtonId = `buttonAbilities${agent.displayName}`;
                    const modalId = `Modal${agent.displayName}`;


                    const markupAgentsBox = `
                        <div class="oneAgentBox ${roleAgent}">
                            <div class="agentLeft">
                                <div class="agentName">
                                    <h2>${agent.displayName}</h2>
                                </div>
                                <div class="agentDesc">
                                    <p>Rôle : ${agent.role?.displayName}</p>
                                    <p>Description : ${agent.description}</p>
                                </div>
                            </div>
                            <div class="agentRight">
                                <img src="${agent.fullPortrait}" alt="agent" class="displayIcon">
                                
                            </div>
                            <div class="abilitiesBox">
                                <button class="buttonAbilities" id="${abilitiesButtonId}">Compétences</button>
                            </div>
                            <dialog id="${modalId}" class="Modal">
                                <div>
                                    <button class="closeModalBtn" data-modal-id="${modalId}">&times;</button>
                                    <div class="titreAbilities">
                                        <h1>Abilités de ${agent.displayName}</h1>
                                    </div>
                                    <div class="contenuAbilities">
                                            <div class="buttonsAbilities">
                                                <button class="buttonAbility buttonAbility1"><img class="imgAbility" src="${tabAbilitiesDisplayIcon[0]}" alt="ImgAbility"></button>
                                                <button class="buttonAbility buttonAbility2"><img class="imgAbility" src="${tabAbilitiesDisplayIcon[1]}" alt="ImgAbility"></button>
                                                <button class="buttonAbility buttonAbility3"><img class="imgAbility" src="${tabAbilitiesDisplayIcon[2]}" alt="ImgAbility"></button>
                                                <button class="buttonAbility buttonAbility4"><img class="imgAbility" src="${tabAbilitiesDisplayIcon[3]}" alt="ImgAbility"></button>
                                             </div>
                                             <div class="descAbility">
                                                <div class = descAbility1>${tabAbilitiesDescription[0]}</div>
                                                <div class = descAbility2>${tabAbilitiesDescription[1]}</div>
                                                <div class = descAbility3>${tabAbilitiesDescription[2]}</div>
                                                <div class = descAbility4>${tabAbilitiesDescription[3]}</div>
                                             </div>
                                    </div>
                                </div>
                            </dialog>
                        </div>
                    `;

                    

                    document.querySelector('.agentsBox').insertAdjacentHTML('beforeend', markupAgentsBox);
                    abilitiesButtons.push(document.getElementById(abilitiesButtonId));
                    modals.push(document.getElementById(modalId));
                } else {
                    console.error('Les données ne sont pas dans le format attendu.');
                }
            });

            buttonAll = document.querySelector('.classAll');
            buttonSentinel = document.querySelector('.classSentinel');
            buttonController = document.querySelector('.classController');
            buttonInitiator = document.querySelector('.classInitiator');
            buttonDuelist = document.querySelector('.classDuelist');

            divSentinel = document.querySelectorAll('.roleSentinelle');
            divController = document.querySelectorAll('.roleControleur');
            divInitiator = document.querySelectorAll('.roleInitiateur');
            divDuelist = document.querySelectorAll('.roleDuelliste');

            buttonAbility1 = document.querySelectorAll('.buttonAbility1');
            buttonAbility2 = document.querySelectorAll('.buttonAbility2');
            buttonAbility3 = document.querySelectorAll('.buttonAbility3');
            buttonAbility4 = document.querySelectorAll('.buttonAbility4');

            descAbility1 = document.querySelectorAll('.descAbility1');
            descAbility2 = document.querySelectorAll('.descAbility2');
            descAbility3 = document.querySelectorAll('.descAbility3');
            descAbility4 = document.querySelectorAll('.descAbility4');

            descAbility1.forEach(function(div){
                div.style.display = 'none';
            });
            descAbility2.forEach(function(div){
                div.style.display = 'none';
            });
            descAbility3.forEach(function(div){
                div.style.display = 'none';
            });
            descAbility4.forEach(function(div){
                div.style.display = 'none';
            });

            

            buttonAbility1.forEach(function(bouton) {
                bouton.addEventListener("click", function (){

                    bouton.style.backgroundColor = '#ff4655'

                    buttonAbility2.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility3.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility4.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })

                    descAbility1.forEach(function(descAbility) {
                        descAbility.style.display = 'block';
                    });

                    descAbility2.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility3.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility4.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });
                })
            });

            buttonAbility2.forEach(function(bouton) {
                bouton.addEventListener("click", function (){

                    bouton.style.backgroundColor = '#ff4655'
                    buttonAbility1.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility3.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility4.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })

                    descAbility1.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility2.forEach(function(descAbility) {
                        descAbility.style.display = 'block';
                    });

                    descAbility3.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility4.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });
                })
            });

            buttonAbility3.forEach(function(bouton) {
                bouton.addEventListener("click", function (){

                    bouton.style.backgroundColor = '#ff4655'
                    buttonAbility1.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility2.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility4.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })

                    descAbility1.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility2.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility3.forEach(function(descAbility) {
                        descAbility.style.display = 'block';
                    });

                    descAbility4.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });
                })
            });

            buttonAbility4.forEach(function(bouton) {
                bouton.addEventListener("click", function (){

                    bouton.style.backgroundColor = '#ff4655'
                    buttonAbility1.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility2.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })
                    buttonAbility3.forEach(function(bouton2) {
                        bouton2.style.backgroundColor = '#0f1923'
                    })

                    descAbility1.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility2.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility3.forEach(function(descAbility) {
                        descAbility.style.display = 'none';
                    });

                    descAbility4.forEach(function(descAbility) {
                        descAbility.style.display = 'block';
                    });
                })
            });

            modals.forEach((modal, index) => {
                modal.addEventListener('click', function (event) {
                    if (event.target === modal) {
                        // Clic en dehors de la fenêtre modale
                        modal.close();
                    }
                });
            });

            buttonAll.addEventListener("click", function () {
                resetButtonBackgroundColors();
                buttonAll.style.backgroundColor = '#ff4655';
                showAllElements();
            });

            buttonSentinel.addEventListener("click", function () {
                resetButtonBackgroundColors();
                buttonSentinel.style.backgroundColor = '#ff4655';
                showElement(divSentinel);
                hideElements(divController);
                hideElements(divDuelist);
                hideElements(divInitiator);
            });

            buttonController.addEventListener("click", function () {
                resetButtonBackgroundColors();
                buttonController.style.backgroundColor = '#ff4655';
                showElement(divController);
                hideElements(divSentinel);
                hideElements(divDuelist);
                hideElements(divInitiator);
            });

            buttonInitiator.addEventListener("click", function () {
                resetButtonBackgroundColors();
                buttonInitiator.style.backgroundColor = '#ff4655';
                showElement(divInitiator);
                hideElements(divSentinel);
                hideElements(divController);
                hideElements(divDuelist);
            });

            buttonDuelist.addEventListener("click", function () {
                resetButtonBackgroundColors();
                buttonDuelist.style.backgroundColor = '#ff4655';
                showElement(divDuelist);
                hideElements(divSentinel);
                hideElements(divController);
                hideElements(divInitiator);
            });

            abilitiesButtons.forEach((button, index) => {
                button.addEventListener('click', function () {
                    modals[index].showModal();
                });
            });
        
            document.querySelectorAll('.closeModalBtn').forEach(closeModalBtn => {
                closeModalBtn.addEventListener('click', function () {
                    const modalId = this.getAttribute('data-modal-id');
                    document.getElementById(modalId).close();
                });
            });

        })
        .catch(error => {
            console.error('Erreur lors de la récupération des données:', error);
        });


        //Switch Theme

//     if (switchTheme.checked) {
        
//     }

//     else {

        

//     }

//     switchTheme.addEventListener('change', function () {
//         if (switchTheme.checked) {
            
//         }

//         else {

            
//         }
//     });


});


// Fonction appelée lorsque le bouton est cliqué
function openDialog() {
    // URL vide, peut être remplacée par une URL spécifique
    var url = '';
    // Les paramètres de la fenêtre, par exemple, la largeur, la hauteur, etc.
    var options = 'width=400,height=300';

    // Ouvre la fenêtre de dialogue
    window.open(url, 'Dialog', options);
};

function resetButtonBackgroundColors() {
    buttonAll.style.backgroundColor = 'rgb(17, 17, 17)';
    buttonSentinel.style.backgroundColor = 'rgb(17, 17, 17)';
    buttonController.style.backgroundColor = 'rgb(17, 17, 17)';
    buttonInitiator.style.backgroundColor = 'rgb(17, 17, 17)';
    buttonDuelist.style.backgroundColor = 'rgb(17, 17, 17)';
};

function hideElements(elements) {
    elements.forEach(function (element) {
        element.style.display = 'none';
    });
};

function showElement(element) {
    element.forEach(function (element) {
        element.style.display = 'flex';
    })
};

function showAllElements() {
    divSentinel.forEach(function (element) {
        element.style.display = 'flex';
    });
    divController.forEach(function (element) {
        element.style.display = 'flex';
    });
    divInitiator.forEach(function (element) {
        element.style.display = 'flex';
    });
    divDuelist.forEach(function (element) {
        element.style.display = 'flex';
    });
}
