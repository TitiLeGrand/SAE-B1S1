const questions = [
    {
        question : "Quel est cet agent ?",
        reponses : [
            {text : "Astra", correct : true},
            {text : "Omen", correct : false},
            {text : "Brimstone", correct : false},
            {text : "Reyna", correct : false},
        ],
        image : `img/Astra_Icon.png`
    },
    {
        question : "Quel est cet agent ?",
        reponses : [
            {text : "Kay/O", correct : false},
            {text : "Viper", correct : false},
            {text : "Yoru", correct : true},
            {text : "Raze", correct : false},
        ],
        image : `img/Yoru_icon.webp`
    },
    {
        question : "Quel est le nom de cette map ?",
        reponses : [
            {text : "Lotus", correct : false},
            {text : "Bind", correct : false},
            {text : "Breeze", correct : false},
            {text : "Ascent", correct : true},
        ],
        image : `img/Loading_Screen_Ascent.webp`
    },
    {
        question : "Comment se nomme cette arme ?",
        reponses : [
            {text : "Vandal", correct : false},
            {text : "Phantom", correct : false},
            {text : "Ghost", correct : true},
            {text : "Odin", correct : false},
        ],
        image : `img/ghostIcon.png`
    },
    {
        question : "A qui appartient cette compétence ? (Grenade à essaim de nanites)",
        reponses : [
            {text : "Jett", correct : false},
            {text : "Killjoy", correct : true},
            {text : "Raze", correct : false},
            {text : "Cypher", correct : false},
        ],
        image : `img/Nanoswarm.webp`
    },
    {
        question : "A qui est cet ultimate ? (Overdrive)",
        reponses : [
            {text : "Neon", correct : true},
            {text : "Breach", correct : false},
            {text : "Omen", correct : false},
            {text : "Kay/O", correct : false},
        ],
        image : `img/Overdrive.webp`
    },

];


const questionElement = document.getElementById('question');
const BoutonsReponses = document.getElementById('BoutonsReponses');
const NextButton = document.getElementById('nextBtn');
const imageElement = document.createElement("img");
imageElement.classList.add("img");

let currentQuestionIndex = 0;
let score = 0;

function startQuiz(){
    currentQuestionIndex = 0;
    score = 0;
    NextButton.innerHTML = "Suivant";
    showQuestion();
}

function showQuestion(){
    resetState();
    let currentQuestion = questions[currentQuestionIndex];
    let questionNo = currentQuestionIndex + 1;
    questionElement.innerHTML = questionNo + ". " + currentQuestion.question;

    imageElement.style.display = 'block';
    imageElement.src = currentQuestion.image;
    const imageContainer = document.getElementById("imgBoxQuiz");
    imageContainer.innerHTML = "";
    imageContainer.appendChild(imageElement);

    currentQuestion.reponses.forEach(reponse => {
        const button = document.createElement("button");
        button.innerHTML = reponse.text;
        button.classList.add("btn");
        BoutonsReponses.appendChild(button);
        if(reponse.correct){
            button.dataset.correct = reponse.correct;
        }
        button.addEventListener("click", selectAnswer);
    })
}

function resetState(){
    NextButton.style.display = 'none';
    while(BoutonsReponses.firstChild){
        BoutonsReponses.removeChild(BoutonsReponses.firstChild);
    }
}
 
function selectAnswer(e){
    const selectedBtn = e.target;
    const isCorrect = selectedBtn.dataset.correct === "true";
    if(isCorrect){
        selectedBtn.classList.add("correct");
        score++;
    }else{
        selectedBtn.classList.add("incorrect");
    }
    Array.from(BoutonsReponses.children).forEach(button => {
        if(button.dataset.correct === "true"){
            button.classList.add("correct");
        }
        button.disabled = true;
    });
    NextButton.style.display = "block";
}

function showScore(){
    resetState();
    imageElement.style.display = 'none';
    questionElement.innerHTML = `Votre score est de ${score} sur ${questions.length}`;
    NextButton.innerHTML = "Rejouer";
    NextButton.style.display = 'block';
}

function handleNextButton(){
    currentQuestionIndex++;
    if(currentQuestionIndex < questions.length){
        showQuestion();
    }
    else {
        showScore();
    }
}



NextButton.addEventListener("click", ()=>{
    if(currentQuestionIndex < questions.length){
        handleNextButton();
    }
    else {
        startQuiz();
    }
})

startQuiz();
