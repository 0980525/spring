//trigger 클릭하면 file-이 실행되게 함
document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('file').click();

})

//정규표현식을 사용하여 파일 형식제한 함수 만들기 
//실행파일(exe,bat,sh,mis,sll,jar) 막기 (이유: 바이러스때문)
//파일 사이즈 체크(20M 사이즈보다 크면 막기)
// - 선택사항- 이미지 파일만 올리기 (jpg,jpeg,gif,png,bmp)

//실행타입 패턴 정의
const regExp = new RegExp("\.(exe|bat|sh|mis|sll|jar)$");
//이미지파일 패턴 정의
const regExpImg = new RegExp("\.(jpg|jpeg|gif|png|bmp)$");
//20MB 사이즈로 설정
const maxSize = 1024*1024*20;

//validation : 규칙 설정을 할때 사용 ex-회원가입
//regBtn (글쓰기 버튼id) 규칙을 지키면 활성화되게끔하는거
//return 0 / 1 (true) 로 리턴
function fileValidation(name,fileSize){
    //파일이름을 소문자로 변환
   let fileName= name.toLowerCase();
    //파일이름이 실행파일인지 확인
    if(regExp.test(fileName)){ 
        return 0;
    }else if(fileSize > maxSize){
        return 0;
    }else if(!regExpImg.test(fileName)){
        return 0;
    }else{
        return 1;
    }
}

//첨부파일에 따라 등록가능한지 체크하는 함수
//전체화면에서 바뀌는 부분이 있다면 addEventListener 'change' (e객체를? 콘솔에 찍음)
document.addEventListener('change',(e)=>{
    console.log(e.target);
    if(e.target.id === 'file'){
        //여러개의 파일이 배열로 들어옴

        const fileObject = document.getElementById('file').files;
        console.log(fileObject);
        document.getElementById('regBtn').disabled=false;
        let div = document.getElementById('fileZone');
        //기존에 추가했던 파일 삭제
        div.innerHTML = '';
        //fileZone > ul > li (파일 갯수만큼 li가 추가되는 형식)
        let ul = `<ul class="list-group">`;
        //fileValidation 함수의 리턴 여부를 체크
        //여러가지의 파일을 첨부할때 모든 파일이 1이어야 가능 
        // 리턴의 값 *로 isOk 처리하여 모든 파일이 1이어야 통과
        let isOk = 1;
        for(let file of fileObject){
            //한 파일에 대한 결과
            let validResult = fileValidation(file.name,file.size);
            //isOk=전체결과
            isOk *= validResult;
            ul += `<li class="list-group-item">`;
            //업로드 가능 여부 표시
            ul += `<div>${validResult? '업로드 가능':'업로드 불가능'}</div>`;
            ul += `${file.name}`;
            ul += `<span class="badge text-bg-${validResult? 'success':'danger'}">${file.size}Byte</span>`;
            ul += `</li>`;

        }
        ul += `</ul>`;
        div.innerHTML = ul;

        //업로드 불가능한 파일이 1개라도 있다면 
        if(isOk == 0){
            //버튼 비활성화
            document.getElementById('regBtn').disabled = true;
        }
    }
})