console.log("board modify in!");

async function removeImgFile(uuid){
    try {
        const url="/board/"+uuid;
        const config ={
            method:"delete"
        }
        const resp= await fetch(url,config);
        const result=await resp.text();

        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click',(e)=>{
    console.log(e.target);
    if(e.target.classList.contains('cmtDelBtn')){
        //필요한 cno변수값 (data-cno="${result[i].cno}")을 얻기
        //let cnoVal = e.target-delBtn
        let uuid = e.target.dataset.uuid;
        console.log(uuid);
        let li = e.target.closest('li');
        
        removeImgFile(uuid).then(result=>{
            li.remove();
        })
    }
})