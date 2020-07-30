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
            <label>No.</label><input readonly class="form-control" name="bno" value="<c:out value='${post.bno}'/>">
            <label>title</label><input readonly class="form-control" name="title" value="<c:out value='${post.title}'/>">
            <label>writer</label><input readonly class="form-control" name="writer" value="<c:out value='${post.writer}'/>">
            <label>content</label>
            <textarea readonly class="form-control" name="content"><c:out value='${post.content}'/></textarea>

            <div class="card-body">
                <button class="btn btn-primary">goList</button>
                <button class="btn btn-warning">Modify</button>
            </div>
        </div>
    </div>
</main>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script type="application/javascript" src="/resources/src/js/commons.js"></script>
<script
        src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        const result = '<c:out value="${result}"/>';
        checkModel(result);

        history.replaceState({},null,null);
        function checkModel(result) {
            if (result === '' || history.state) {
                return;
            } else {
                $(".modal-body").html(result)
            }
            $("#myModal").modal("show");
        }
    })
</script>
<script>
    window.onload=()=>{
        const goList = document.querySelector(".card-body>.btn-primary");
        const modify = document.querySelector(".card-body>.btn-warning");
        goList.addEventListener("click",()=>{
            window.location.href='/board/list'
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