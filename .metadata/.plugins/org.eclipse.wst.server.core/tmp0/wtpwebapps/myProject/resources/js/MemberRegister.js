document.getElementById('re').disabled=true;

document.getElementById('emailBtn').addEventListener('click', () => {
    let inemail = document.getElementById('email').value;
    getEmailregister(inemail).then(result=>{
        console.log(result);
        if(result === inemail || inemail == '' || inemail== null|| !(inemail.includes("@"))){
            alert("사용할 수 없는 이메일입니다.");
            document.getElementById('re').disabled=true;
        }else{
            alert("사용 가능한 이메일입니다.");
        }
    })

});

async function getEmailregister(inemail){
    try {
        const resp = await fetch("/member/"+inemail);
        const result = await resp.json();
        return result.email;
        
    } catch (error) {
        console.log(error);
    }
}

document.getElementById('pwd2').addEventListener('input', () => {
    let pass1 = document.getElementById('pw1').value;
    let pass2 = document.getElementById('pwd2').value;

    let div = document.getElementById('passZone');

    if (pass1 === pass2 ) {
        div.innerText = '비밀번호가 일치합니다.';
        document.getElementById('re').disabled=false;
    } else{
        div.innerText = '비밀번호가 일치하지 않습니다.';
         document.getElementById('re').disabled=true;
    }

});
