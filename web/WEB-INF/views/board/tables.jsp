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
                <select class="selectpicker">
                    <option>Mustard</option>
                    <option>Ketchup</option>
                    <option>Relish</option>
                </select>
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
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active">
                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</main>
<script>
    window.onload=()=>{
        document.querySelectorAll(".bnos").forEach((td)=>{
            td.addEventListener("click",(e)=>{
                console.log(e.target.innerText);
                let form = document.createElement('form');
                let input = document.createElement('input');
                form.action='/board/read';
                form.method='GET';
                input.value=e.target.innerText;
                input.name='bno';
                form.append(input);
                document.body.append(form);
                form.submit();

            })
        });
    }
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>