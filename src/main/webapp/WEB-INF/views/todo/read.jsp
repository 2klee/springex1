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
  <div class="card-body">
    <form action="/todo/list" method="post">
    <div class="input-group mb-3">
      <span class="input-group-text">Tno</span>
      <input type="text" name="tno" class="form-control" value="<c:out value="${dto.tno}"></c:out>" readonly>
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text">Title</span>
      <input type="text" name="title" class="form-control" value="<c:out value="${dto.title}"></c:out>" readonly>
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text">DueDate</span>
      <input type="date" name="dueDate" class="form-control"
             value=<c:out value="${dto.dueDate}"></c:out> readonly>
    </div>

    <div class="input-group mb-3">
      <span class="input-group-text">Writer</span>
      <input type="text" name="writer" class="form-control"
             value=<c:out value="${dto.writer}"></c:out> readonly>

    </div>

    <div class="form-check">
      <label class="form-check-label" >
        Finished &nbsp;
      </label>
      <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""} disabled >
    </div>

    <div class="my-4">
      <div class="float-end">
<%--        <button type="button" id="remove" class="btn btn-danger">Remove</button>--%>
        <button type="button" id="modify" class="btn btn-primary">Modify</button>
        <button type="button" id="list" class="btn btn-secondary">List</button>
      </div>
    </div>
    </form>
  </div>
</div>


<script>

  document.querySelector("#modify").addEventListener("click",function (){
      self.location = '/todo/modify?tno=${dto.tno}&${pageRequestDTO.link}'
  },false);
  document.querySelector("#list").addEventListener("click", function(){
      self.location = '/todo/list?${pageRequestDTO.link}';
  },false);
</script>



</body>
</html>
