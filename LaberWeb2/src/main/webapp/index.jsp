<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/styles_main.css"/>
    <title>WebLab 2</title>
</head>


<body>
<div class="studentInfo">
    <p>ФИО: Одинцов Максим Николаевич</p>
    <p>Группа: P3225</p>
    <p>Вариант: 861211
    </p>
</div>
<div>
    <div class="graph">
        <canvas id="graph" width="520" height="480"></canvas>
    </div>

    <div class="point">
        <canvas id="point" width="520" height="480"></canvas>
    </div>
</div>
<div class="form">
        <input type="text" id="xCoo" name="x" onchange="check(this); dot()" placeholder="(-5, 5)">
            <div class="formYAndR">
                <input style="display: none" id="y" name="y" />
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="-4">-4
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="-3">-3
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="-2">-2
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="-1">-1
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="0">0
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="1">1
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="2">2
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="3">3
                </label>
                <label>
                    <input type="radio" onclick="setY(this.value)" name="y" value="-4">-4
                </label>
                <input style="display: none" id="r" name="r"/>
                <label>
                    <input type="radio" onclick="drawGraph(this.value)" name="r" value="1">1
                </label>
                <label>
                    <input type="radio" onclick="drawGraph(this.value)" name="r" value="1.5">1.5
                </label>
                <label>
                    <input type="radio" onclick="drawGraph(this.value)" name="r" value="2">2
                </label>
                <label>
                    <input type="radio" onclick="drawGraph(this.value)" name="r" value="2.5">2.5
                </label>
                <label>
                    <input type="radio" onclick="drawGraph(this.value)" name="r" value="3">3
                </label>
            </div>
        <div>
            <button id="sendButton" onclick="send()">Отправить</button>
        </div>
    </div>
<div class="resultTable">
    <div id="tableContainer">
        <table>
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Start Date</th>
                <th>Result</th>
                <th>Execute Time</th>
            </tr>
            <c:forEach items="${listData}" var="data">
                <tr>
                    <td>${data.x}</td>
                    <td>${data.y}</td>
                    <td>${data.r}</td>
                    <td>${data.startDate}</td>
                    <td>${data.result}</td>
                    <td>${data.executeTime}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>
<script src="resources/js/coordinate_system.js"></script>
<script src="resources/js/checkData.js"></script>
<script src="resources/js/send.js"></script>
</body>
</html>
