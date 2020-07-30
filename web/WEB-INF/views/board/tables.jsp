<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/views/includes/header.jsp" %>

<main>
    <div class="container-fluid">
        <h1 class="mt-4">Tables</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">Tables</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                DataTables is a third party plugin that is used to generate the demo table below. For more information
                about DataTables, please visit the
                <c:out value="hello"/>
                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>

            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table mr-1"></i>
                DataTable Example
                <select class="selectpicker amount">
                    <option <c:if test="${pageMaker.pageDTO.amount == 10}">selected</c:if> >10</option>
                    <option <c:if test="${pageMaker.pageDTO.amount == 20}">selected</c:if> >20</option>
                    <option <c:if test="${pageMaker.pageDTO.amount == 30}">selected</c:if> >30</option>
                </select>
                <button class="btn btn-primary">Register</button>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>bno</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Writer</th>
                            <th>ModDate</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>bno</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Writer</th>
                            <th>ModDate</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach var="post" items="${listMap}">
                            <tr>

                                <td class="bnos">
                                    <c:out value="${post.bno}"/>
                                </td>
                                <td>
                                    <c:out value="${post.title}"/>
                                </td>
                                <td>
                                    <c:out value="${post.content}"/>
                                </td>
                                <td>
                                    <c:out value="${post.writer}"/>
                                </td>
                                <td>
                                    <c:out value="${post.moddate}"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="...">
                    <ul class="pagination">
                        <c:if test="${pageMaker.prev}">
                            <li class="page-item">
                                <a class="page-link pageNums" href="${pageMaker.start-1}">prev</a>
                            </li>
                        </c:if>
                        <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                            <li class="page-item ${pageMaker.pageDTO.page == num ? 'active' : ''}">
                                <a class="page-link pageNums" href="${num}">${num}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                            <li class="page-item">
                                <a class="page-link pageNums" href="${pageMaker.end+1}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
                <div class="searchForm">
                    <select class="selectpicker">
                        <option>제목</option>
                        <option>내용</option>
                        <option>제목+내용</option>
                    </select>&nbsp
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success btn-rounded btn-sm my-0" type="submit">Search</button>
                </div>
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
<form class="actionForm">
    <input type="hidden" name="page" value="${pageMaker.pageDTO.page}">
    <input type="hidden" name="amount" value="${pageMaker.pageDTO.amount}">
</form>
<script
        src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        const result = '<c:out value="${result}"/>';
        checkModel(result);

        history.replaceState({}, null, null);

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
    window.onload = () => {
        document.querySelectorAll(".bnos").forEach((td) => {
            td.addEventListener("click", (e) => {
                console.log(e.target.innerText);
                let form = document.createElement('form');
                let input = document.createElement('input');
                form.action = '/board/read';
                form.method = 'GET';
                input.value = e.target.innerText;
                input.name = 'bno';
                form.append(input);
                document.body.append(form);
                form.submit();

            })
        });

        document.querySelector(".card-header>.btn-primary")
            .addEventListener("click", () => {
                window.location.href = "/board/register";
            });
        document.querySelectorAll(".pageNums").forEach((a)=>{
            a.addEventListener("click",(e)=>{
                e.preventDefault();
                let form = document.querySelector(".actionForm");
                let pageInput = document.querySelector(".actionForm>input[name=page]");
                form.method="GET";
                form.action="/board/list";
                pageInput.value=e.target.href.split("/")[4];
                form.submit();
            })
        })
        document.querySelector(".amount").addEventListener("change",(e)=>{
            console.log(e.target.value)
            let form = document.querySelector(".actionForm");
            let amountInput = document.querySelector(".actionForm>input[name=amount]");
            form.method="GET";
            form.action="/board/list";
            amountInput.value = e.target.value;
            form.submit();
        })
    }
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>