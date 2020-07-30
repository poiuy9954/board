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
            <h1>Register</h1>
        </div>
        <div class="card-body">
            <label>title</label><input class="form-control" name="title" value="">
            <label>writer</label><input readonly class="form-control" name="writer" value="">
            <label>content</label>
            <textarea class="form-control" name="content"></textarea>

            <div class="card-body">
                <button class="btn btn-info">Complete</button>
                <button class="btn btn-danger">goList</button>
            </div>
        </div>
    </div>
</main>
<script type="application/javascript" src="/resources/src/js/commons.js"></script>
<script>
    window.onload=()=>{
        const cancel = document.querySelector(".card-body>.btn-danger");
        const complete = document.querySelector(".card-body>.btn-info");
        cancel.addEventListener("click",()=>{
            window.location.href='/board/list'
        })
        complete.addEventListener("click",()=>{
            formCreate((form)=>{
                let inputs = document.querySelectorAll(".card-body>.form-control")
                inputs.forEach((input)=>{
                    form.append(input);
                })
                form.action="/board/register"
                form.method="POST"
            })
        })
    }
</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>