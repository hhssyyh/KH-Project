<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

   
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>


<script type="text/javascript">
$(function() {      
      
   $("#freeboardContent").summernote({
         height: 300,
         placeholder: "본문 내용",
         focus: true
      })
      
      $("#btnCancle").click(function(){
          history.go(-1)();
       });

   
      
})


</script>



<style type="text/css">

a {
   color: black;
   text-decoration: none;
}

.modal {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   display: none;
   background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
   display: block;
}

.modal2 {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   display: none;
   background-color: rgba(0, 0, 0, 0.4);
}

.modal2.show {
   display: block;
}

.modal_body {
   position: absolute;
   top: 50%;
   left: 50%;
   width: 420px;
   height: 100px;
   padding: 40px;
   text-align: center;
   background-color: rgb(255, 255, 255);
   border-radius: 10px;
   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
   transform: translateX(-50%) translateY(-50%);
}

.modal2_body {
   position: absolute;
   top: 50%;
   left: 50%;
   width: 420px;
   height: 100px;
   padding: 40px;
   text-align: center;
   background-color: rgb(255, 255, 255);
   border-radius: 10px;
   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
   transform: translateX(-50%) translateY(-50%);
}

/* * { */
/*    font-family: 'Gowun Batang', serif; */
/* } */

#writeContainter {
   margin-top: 54px;
}

#header, #footer {
   text-align: center;
}
.btn-info {
   font-family: 'SBAggroM';
   background-color: #7e00c2;
   border-color: transparent;
   color: white;
}
body{
   font-family: 'SBAggroL';
}
.container {
   margin: 0 auto;
}

</style>



<div id="writeContainter" class="container">

   <br>
   <br>

   <h1 style="text-align: center; font-family: 'SBAggroM';">
         <i class="bi bi-journal-text"></i>&nbsp;&nbsp;게시글 작성
         </h1>
   <br>
   <hr>
   <br>

   <form action="./write" method="post" enctype="multipart/form-data">

      <input style="width: 450px;" name="freeboardTitle" type="text"
      class="form-control" placeholder="제목" required><br>
      <br>


      <textarea style="display: none" id="freeboardContent"
         name="freeboardContent"></textarea>

      <input type="file" name="dataMul" multiple="multiple">

      <div class="modal">
         <div class="modal_body">
            게시글을 등록하시겠습니까?&nbsp;&nbsp;&nbsp;
            <button type="submit"
               class="btn btn-info btn-sm">확인</button>
            <button type="button"
               class="btnModalCancle btn btn-info btn-sm ">취소</button>
         </div>
      </div>

      <div class="modal2">
         <div class="modal2_body">
            게시글작성을 중단하시겠습니까?&nbsp;&nbsp;&nbsp;
            <button type="button"
               class="btn btn-info btn-sm" id="btnCancle" >확인</button>
            <button type="button"
               class="btnModalCancle2 btn btn-info btn-sm">취소</button>
         </div>
      </div>

      <div class="text-end">
         <button type="button" class="btn-open-popup btn btn-info">작성</button>
         <button type="button" class="btn-reset-popup btn btn-info">취소</button>
      </div>
   </form>
   <br>

</div>

<script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');
      const btnModalCancle = document.querySelector('.btnModalCancle');
      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show'); 

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
          
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');
          

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });

      btnModalCancle.addEventListener('click', (event) => {
         modal.classList.remove('show'); 
      });
      
    </script>

<script>
      const body2 = document.querySelector('body');
      const modal2 = document.querySelector('.modal2');
      const btnOpenPopup2 = document.querySelector('.btn-reset-popup');
      const btnModalCancle2 = document.querySelector('.btnModalCancle2');
      

      btnOpenPopup2.addEventListener('click', () => {
        modal2.classList.toggle('show');

        if (modal2.classList.contains('show')) {
          body2.style.overflow = 'hidden';
        }
      });

      modal2.addEventListener('click', (event) => {
        if (event.target === modal2) {
          modal2.classList.toggle('show');

          if (!modal2.classList.contains('show')) {
            body2.style.overflow = 'auto';
          }
        }
      });
      
      btnModalCancle2.addEventListener('click', (event) => {
         modal2.classList.remove('show'); 
      });
      
      
    </script>



<c:import url="/WEB-INF/views/layout/footer.jsp" />