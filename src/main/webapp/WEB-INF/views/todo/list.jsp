<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" type="" href="">

  <title>Hello, world!</title>
</head>
<body>

<%--  <section class="intro">--%>
<%--    <div class="bg-image h-100" style="background-color: #f5f7fa;">--%>
<%--      <div class="mask d-flex align-items-center h-100">--%>
        <div class="container pt-5">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="card">
                <div class="row content">
                  <div class="col">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">Search </h5>
                        <form action="/todo/list" id="search" method="get">
                          <input type="hidden" name="size" value="${pageRequestDTO.size}"/>
                          <div class="mb-3">
                            <input type="checkbox" name="finished"
                                          ${pageRequestDTO.finished?"checked":""}
                            >완료여부
                          </div>
                          <div class="mb-3">
                            <input type="checkbox" name="types" value="t"
                                          ${pageRequestDTO.checkType("t")?"checked":""}
                            >제목
                            <input type="checkbox" name="types" value="w"
                                          ${pageRequestDTO.checkType("w")?"checked":""}
                            >작성자
                            <input type="text" name="keyword" class="form-control"
                                                 value='<c:out value="${pageRequestDTO.keyword}"/>'
                            >

                          </div>
                          <div class="input-group mb-3 dueDateDiv">
                            <input type="date" name="from" class="form-control"
                                                 value="${pageRequestDTO.from}"
                            >
                            <input type="date" name="to" class="form-control"
                                                 value="${pageRequestDTO.to}"
                            >
                          </div>
                          <div class="mb-3">
                            <div class="float-end">
                              <button class="btn btn-primary" type="submit">Search</button>
                              <button class="btn btn-info clearBtn" type="reset" id="reset">Clear</button>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body p-0">
                  <div class="table-responsive table-scroll" data-mdb-perfect-scrollbar="true" <%--style="position: relative; height: 700px"--%>>
                    <h5>title</h5>
                    <button type="button" class="btn btn-primary" id="register">register</button>
                    <table class="table table-striped mb-0">
                      <thead style="background-color: #002d72; color: white;">
                      <tr>
                        <th scope="col">Tno</th>
                        <th scope="col">Title</th>
                        <th scope="col">Writer</th>
                        <th scope="col">DueDate</th>
                        <th scope="col">Finished</th>
                      </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${responseDTO.dtoList}" var="dto">
                          <tr>
                            <th scope="row"><c:out value="${dto.tno}"/></th>
                            <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none" data-tno="${dto.tno}" >
                              <c:out value="${dto.title}"/></a>
                            </td>
                            <td><c:out value="${dto.writer}"/></td>
                            <td><c:out value="${dto.dueDate}"/></td>
                            <td><c:out value="${dto.finished}"/></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>

                  <div class="d-flex justify-content-center mt-3">
                    <ul id="paging" class="pagination flex-wrap">
                      <c:if test = "${responseDTO.prev}">
                        <li class="page-item">
                          <a class="page-link" data-num="${responseDTO.start - 1}">이전</a>
                        </li>
                      </c:if>

                      <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                        <li class="page-item ${responseDTO.page == num? "active":""}">
                          <a class="page-link" data-num="${num}">${num}</a>
                        </li>
                      </c:forEach>

                      <c:if test = "${responseDTO.next}">
                        <li class="page-item">
                          <a class="page-link" data-num="${responseDTO.end + 1}">다음</a>
                        </li>
                      </c:if>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<%--      </div>--%>
<%--    </div>--%>
<%--  </section>--%>
<script>
  document.querySelector('#register').addEventListener('click',function (){
      location.href = "/todo/register";
  });

  document.querySelector('#paging').addEventListener('click',function (e){
      e.preventDefault()
      e.stopPropagation()

      const target = e.target

      if(target.tagName !== 'A'){
          return
      }
      const num = target.getAttribute("data-num")

      const formObj = document.querySelector('form')

      formObj.innerHTML += `<input type="hidden" name="page" value="\${num}">`

      formObj.submit();

  }, false);

  // document.querySelector('#reset').addEventListener('click', function (){
  //     document.getElementById('#search').reset();
  // })

  document.querySelector('#reset').addEventListener('click', function (){
      location.href = "/todo/list";
  })





</script>
</body>
</html>
