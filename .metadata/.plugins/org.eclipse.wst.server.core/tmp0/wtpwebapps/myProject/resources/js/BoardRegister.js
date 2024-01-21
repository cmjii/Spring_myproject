console.log("in");

//실행파일, 이미지파일, 파일 최대 사이즈 정규 표현식 작성
const regExp = new RegExp("\.(exe|sh|bat|dll|jar|msi)$");
const maxsize = 1024*1024*20; //파일 최대 크기 설정

function fileValidation(fileName, fileSize){
    if(regExp.test(fileName)){
        return 0;
    }else if(maxsize<fileSize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    console.log(e.target.id);
    if(e.target.id == 'file'){
        const fileObject = document.getElementById('file').files;
        console.log(fileObject);

        document.getElementById('btn').disabled=false;

        //첨부파일에 대한 정보를 fileZone에 기록
        let div = document.getElementById('fileZone');
        div.innerHTML='';
        let ul = `<ul class="list-group">`;
        //isok로 통과 불통과 구분
        let isok = 1;
        for(let file of fileObject){
            let validresult = fileValidation(file.name, file.size);
            isok *= validresult;
            ul += `<li class="list-group-item>`;
            ul += `<div class="mb-3">`;
            ul += `${validresult ? '<div class="fw-bold"> 업로드 가능 </div> ': '<div class="fw-bold text-danger">업로드 불가능</div>'}`;
            ul += `${file.name}</div>`;
            ul += `<span class="badge text-bg-${validresult ? 'success' : 'danger'}">${file.size}Byte</span>`;
            ul +=`</li>`;
        }
        ul += `</ul>`
        div.innerHTML = ul;

        if(isok ==0){
            document.getElementById('btn').disabled=true;
        }

    }
})