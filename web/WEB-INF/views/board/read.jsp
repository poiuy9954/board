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
            <h1>READ</h1>
        </div>
        <div class="card-body">
            <label>No.</label><input class="form-control" name="bno" value="<c:out value='${post.bno}'/>">
            <label>title</label><input class="form-control" name="title" value="<c:out value='${post.title}'/>">
            <label>writer</label><input class="form-control" name="writer" value="<c:out value='${post.writer}'/>">
            <label>content</label>
            <textarea class="form-control" name="content"><c:out value='${post.content}'/></textarea>

            <div class="card-body">
                <button class="btn btn-primary">goList</button>
                <button class="btn btn-warning">Modify</button>
            </div>
        </div>
    </div>
</main>
<script type="application/javascript" src="/resources/src/js/commons.js"></script>
<script>
    window.onload=()=>{
        const goList = document.querySelector(".card-body>.btn-primary");
        const modify = document.querySelector(".card-body>.btn-warning");
        goList.addEventListener("click",()=>{

        })
        modify.addEventListener("click",()=>{
            formCreate((form)=>{
                form.append(document.querySelector("input[name=bno]"));
                form.action = "/board/modify"
                form.method = "GET";
            })
        })
    }
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>