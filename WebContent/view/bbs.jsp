<%@page import="javax.xml.bind.ParseConversionEvent"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SomeDAO"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    //버튼 클릭 이벤트가 발생할 경우 pageNum가 +-1이 됨으로 페이지가 넘어감.
    String pageNum = request.getParameter("pageNum"); 
   if(pageNum == null){   // pageNum변수 지정 
      pageNum ="1";  //첫번째 페이지
   } //bbstable에 있는 모든 게시물을 가져오기 위해 dao 객체 생성
   SomeDAO dao = new SomeDAO();  
   //게시물 DTO를 받아오기 위해 list객체 생성
   ArrayList<BbsDTO> list = new ArrayList<BbsDTO>(); 
   //string변수인 pageNum을 int형으로 변환
   int PageNum = Integer.parseInt(pageNum);
   //list에 dao를 통해 받아온 게시물을 넣음.
   list = dao.listAll((PageNum*5)-5);
   
   %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>S.O.M.E</title>
  <script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
  <script type="text/javascript">



     $(function() {
        //클릭버튼 이벤트
      $('#write-btn').click(function() {/* 로그인한 회원만 글을 작성할 수 있도록 해야함. */
         //밑에 id가 id인 div에 text를 불러옴
         var idValue = $('#id').text();
         //밑에서의 조건으로 id div에 로그인이 필요합니다 라는 문구가 적혀있으면 로그인이 안된 상태.
         if (idValue=="로그인이 필요합니다.") { 
            alert("로그인이 필요합니다.")  //안내 메세지 출력 후
            location.href="login.jsp" //로그인 화면으로 이동
         }else{// 로그인이 되어있는 경우
         //DB에 auto_increment설정을 해놨기때문에 null로 값을 보내줌.
         var noValue = null; 
         //별점에 체크되어 있는 value값을 starValue에 저장
         var starValue = $('[name=star]:checked').val();
         //게시물의 내용을 contentValue에 저장
         var contentValue = $('#content').val();
         //DB에 CURRENT_TIMESTEMP로 설정되어 있기때문에 null로 값을 보내줌.
         var dateValue = null;
         // 작성자가 selectbox에서 선택한 값을 serviceValue에 저장
         var serviceValue = $('#service option:selected').val();
         // bbsControl에서 실시할 action을 actionValue로 보내줌
         var actionValue = "insert";
         //내용이 공백일 경우
         if (contentValue=="") {
            alert("후기작성을 해주시기 바랍니다.")
         }
         else {
         //모든 값이 잘 입력되었을 때 ajax를 통해 controller에 값 전송
         $.ajax({
            url: "../control/controlBbs.jsp",
            data : {
               action : actionValue,
               no : noValue,
               id : idValue,
               star : starValue,
               content : contentValue,
               date : dateValue,
               service : serviceValue
            },
            //성공하였을 경우 bbs.jsp로 돌아와 게시물이 올라간것을 확인
            success : function(result) { 
               location.href="bbs.jsp";
            } 
          })
         }
         }
      })
      /* 다음 버튼 눌렀을 때의 클릭 이벤트  */
      $('#nextBtn').click(function() {
         /* 현재 페이지를 text로 받아옴. */
         <%
         if(list.size()<5){ //게시물의 개수가 5개 미만 일 때 
         %>
         // pageNum을 +1하지않고 안내 메세지 출력
         alert("더 이상의 게시물이 없습니다.") 
         <%
         }else{//페이지에 게시물이 꽉 찾을 때
         %>
         var num = $('#num').text();
         //pageNum+1을 하여 다음 5개의 게시물 받아옴.
         var numValue = Number(num)+1; 
         //다음 페이지로 이동
         location.href="bbs.jsp?pageNum="+numValue;
         <%
         }
         %>
      })
      /* 이전 버튼 눌렀을 때의 클릭 이벤트 */
      $('#prevBtn').click(function() {
         //pageNum을 -1하여 이전 페이지로 이동
         var pageNum = Number("<%=pageNum %>")-1;
         //pageNum이 0일경우 pageNum을1로 저장
         if (pageNum == 0) {
            pageNum = 1;
         }
         location.href="bbs.jsp?pageNum="+pageNum;
      })
      
      
   })
  
  </script>
  <!-- 별점 css 설정 -->
  <style type="text/css">
     .starR{
           background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
           background-size: auto 100%;
           width: 25px;
           height: 25px;
           display: inline-block;
           text-indent: -9999px;
      }
   .starR.on{background-position:0 0;}
   #prevBtn  {
      Color : balck;
      border : 1px solid #ffeae8;
      background : #ffeae8;
      width: 35%;
      float : left;
   }
   
   #nextBtn{
      Color : balck;
      border : 1px solid #ffeae8;
      background : #ffeae8;
      margin : 0px;
      width: 35%;
      float : right;
   }
   
   #nextBtn{
   Color : balck;
   border : 1px solid #ffeae8;
   background : #ffeae8;
   }
   
   #write-btn{
      color : black;
      border : 1px solid #ffeae8;
      background : #ffeae8;
   }
   
   #page-control{
      padding-bottom: 30px;
      padding-top: 30px;
   }
   
   
  </style>
  
  
  
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">
   

</head>

<body>

 <jsp:include page="top.jsp"></jsp:include>
  <!-- Content section -->
   <section class="p-5">
      <div class="container-fluid" style="height: 2000px;">
         <div class="row" style="height: 1500px; text-align: center" style="height: 2000px;">
             <div class="col-sm-2">
             </div>
             <div class="col-sm-8 p-1" id="review-bbs" style="height: 2000px;">
             <p style="font-size: 3em; text-align: center;margin-bottom: 40px;">후기 게시판</p>
                  <hr>
                <div class="p-1" id="review-bbs" style="width : 100%; height: 70%">
                     <div id="bbs-list" style=" width : 100%; height: 90%">
                      <%
                         //위에 getparamete를 통해 pageNum를 받아오고 pageNum을 int로 형변환
                         PageNum = Integer.parseInt(pageNum);
                         //dao를 통해 게시물을 5개씩 받아옴.
                         list = dao.listAll((PageNum*5)-5); 
                         //foreach를 통해 dao로 받아온 게시글 DB를 뿌려줌
                         for(BbsDTO dto : list){
                            //string으로 저장된 별점을 int로 형변환
                            int star = Integer.parseInt(dto.getStar());
                      %>
                      <div id="bbs-list-one" style="border : 1px solid gray; margin-top:40px; margin-bottom: 40px; height: 16%; " >
                         <!-- 게시물 목록 반복구간 시작 -->
                         <div id="bbs-info" style="background :#ffeae8; border-bottom : 2px dashed gray; width : 100%; height: 70px" class="p-1">
                            <table style="width :100%;  height: 70px; " >
                               <tr>
                                  <td style="width: 200px; letter-spacing:1px">id : <%= dto.getId() %></td>
                                  <td style="width: 300px; letter-spacing:1px">이용한 서비스 : <%= dto.getService() %></td>
                                  <td style="width: 300px; letter-spacing:1px">
                                     별점 :   
                                       <%
                                          for(int j=0 ; j < star ; j++){
                                       %>
                                             <span class="starR on">별</span>
                                       <%
                                          }
                                       %>
                                  </td>
                               </tr>
                            </table>
                         </div>
                         <div id="bbs-content" style="width : 100%; height: 110px; " class="p-1">
                            <div class="bbsStyle" style=" width : 25%; padding-top: 45px; float : left; height: 95px">
                               후기
                            </div>
                            <div class="bbsStyle" style="width : 75%; padding : 15px;  text-align: left; float : left; height: 95px">
                               <%= dto.getContent() %>
                            </div>
                         </div>
                      </div>
                      <%
                         }
                      %>
                      <!-- 게시물 목록 반복구간 끝 -->
                   </div>
                     <div id="page-control" style=" height: 10%; font-size: 25px;">
                     <button type="button" id="prevBtn" class="btn btn-lg btn-block" >이전</button>
                        <!-- 현재 페이지 표시 -->
                        <span id="num"><%=PageNum %></span>
                     <button type="button" id="nextBtn" class="btn btn-lg btn-block" >다음</button>
                   </div>
                   </div>
                   <hr>
                   <!-- 게시물 올리는 div -->
                  <div id="bbs-write" style="width : 100%; height: 30%px">
                     <div  class="p-3" style="width: 35%; height : 70px;float : left;">
                        별점
                     </div>
                     <!-- 별점 표시 div -->
                     <div style="width: 65%; height : 70px; float : right;" class="starRev p-3" >
                       <input type="radio" name="star" value="1" id="jb-radio-1">
                       <span class="starR on">별</span>
                       <input type="radio" name="star" value="2" id="jb-radio-1">
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <input type="radio" name="star" value="3" id="jb-radio-1">
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <input type="radio" name="star" value="4" id="jb-radio-1">
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <input type="radio" name="star" value="5" id="jb-radio-1" checked="checked">
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                       <span class="starR on">별</span>
                     </div>
                     <div class="p-3" style="width: 35%;height : 70px; float : left;">
                        아이디
                     </div>
                     <!-- 아이디 표시 div -->
                     <%
                        String id = (String) session.getAttribute("id");
                        if (id==null) { //session에 id가 null값일 경우 
                     %>
                     <div class="p-3" style="width: 65%;height : 70px; float : right;">
                        <p id="id">로그인이 필요합니다.</p>
                     </div>
                     <%
                        }else{ //session에 id가 존재할 경우
                     %>
                     <div class="p-3" style="width: 65%;height : 70px; float : right;">
                        <p id="id"><%=id %></p>
                     </div>
                     <%      
                        }
                     %>
                     <div style="width: 35%;height : 190px; float : left; padding-top: 80px;"  >
                        내용
                     </div>
                     <!-- 컨텐츠 표시 div -->
                     <div class="p-3" style="width: 65%;height : 190px; float : right;">
                        <input type="text" style="width: 560px;height : 150px; float : left;" id="content" class="form-control" name="content" placeholder="후기 작성">
                     </div>
                     <div style="width: 35%;height : 60px; float : left;" class="p-3" >
                        이용한 서비스
                     </div>
                     <!-- 이용한 서비스 선택 div -->
                     <div class="p-3" style="width: 65%;height : 60px; float : right;">
                        <select id="service" name="service" class="form-control" style="width: 250px">
                           <option>I.Need.Some</option>
                           <option selected>내 마음을 풀어줘</option>
                        </select>
                        <button type="button" id="write-btn" style="float : right;"class="btn btn-primary">올리기</button>
                     </div>
                </div>
                <!-- 게시물 올리는 div 끝 -->
             </div>
             <div class="col-sm-2">
             </div>
          </div>
      </div>
   </section>


<jsp:include page="bottom.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>