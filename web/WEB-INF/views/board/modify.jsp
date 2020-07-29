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
            <label>No.</label><input class="form-control" name="bno" value="<c:out value='${post.bno}'/>">
            <label>title</label><input class="form-control" name="title" value="<c:out value='${post.title}'/>">
            <label>writer</label><input class="form-control" name="writer" value="<c:out value='${post.writer}'/>">
            <label>content</label>
            <textarea class="form-control" name="content"><c:out value='${post.content}'/></textarea>

            <div class="card-body">
                <button class="btn btn-info">Complete</button>
                <button class="btn btn-danger">Delete</button>
                <button class="btn btn-warning">Cancel</button>
            </div>
        </div>
    </div>
</main>
<script type="application/javascript" src="/resources/src/js/commons.js"></script>
<script>
    const completeBTN = document.querySelector(".card-body>.btn-info");
    const deleteBTN = document.querySelector(".card-body>.btn-danger");
    const cancelBTN = document.querySelector(".card-body>.btn-warning");

    completeBTN.addEventListener("click",()=>{
        formCreate((form)=>{
            let inputs = document.querySelectorAll(".card-body>.form-control");
            inputs.forEach((input)=>{
                form.append(input);
            })
            form.action="/board/modify"
            form.method="POST"
        });
    });
    deleteBTN.addEventListener("click",()=>{
        formCreate((form)=>{
            let input = document.querySelector("input[name=bno]");
            form.append(input)
            form.action="/board/delete";
            form.method="POST";
        })
    });
    cancelBTN.addEventListener("click",()=>{

    });
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>