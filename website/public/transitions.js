// Why Use JQuery when you can write WEB2.0 garbage? 

var el = document.getElementsByClassName('broken')[0];
            
el.addEventListener("animationend", function() {
    el.style.animation = 'none';
    el.offsetHeight;

    setTimeout(function(){
        el.style.animation = null;
    }, 2000);
});

var hiddenImage = document.getElementById("hiddenImage")
hiddenImage.addEventListener("animationend", function() {
    hiddenImage.style.visibility="hidden";        
    hiddenImage.style.animation = 'none';
    hiddenImage.offsetHeight;
    hiddenImage.style.animation = null;
    hiddenImage.style.animationPlayState = 'initial';
});

function validate(){
    var form = document.getElementById("submitbox");
    if (form["asm"].value.match("^[a-f0-9]{2,}$")){
        return true;
    }
    
    hiddenImage.style.visibility="visible";
    form["asm"].value = ""; 
    return false;   
}
