<%--
  Created by IntelliJ IDEA.
  User: poiuy
  Date: 2020-07-28
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>
<main>
    <div class="card">
        <div class="card-header">
            <h1>MODIFY</h1>
        </div>
        <div class="card-body">
            <label>No.</label><input class="form-control">
            <label>title</label><input class="form-control">
            <label>writer</label><input class="form-control">
            <label>content</label><textarea class="form-control"></textarea>

            <div class="card-body">
                <button class="btn btn-info">Complete</button>
                <button class="btn btn-danger">Delete</button>
                <button class="btn btn-warning">Cancle</button>
            </div>
        </div>
    </div>
</main>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>