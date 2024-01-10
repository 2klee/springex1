<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%--  <link rel="stylesheet" type="text/css" href="../../../public/css/list.css">--%>

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
                        <c:forEach items="${dtoList}" var="dto">
                          <tr>
                            <th scope="row"><c:out value="${dto.tno}"/></th>
                            <td><a href="/todo/read?tno=${dto.tno}" class="text-decoration-none" data-tno="${dto.tno}" >
                              <c:out value="${dto.title}"/></a></td>
                            <td><c:out value="${dto.writer}"/></td>
                            <td><c:out value="${dto.dueDate}"/></td>
                            <td><c:out value="${dto.finished}"/></td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
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
  })
</script>
</body>
</html>
