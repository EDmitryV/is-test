<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <meta charset="utf-8">
        <title>Результаты поиска</title>
    </head>
    <body>
    <g:applyLayout name="menuBar" content="menuBar"/>
    <g:if test="${count == 0}">
    <p>По Вашему запросу ничего не найдено</p>
    <g:applyLayout name="searchFilter" content="searchFilter"/>
    </g:if><g:else>
       <p>Найдено ${count} отелей</p>
       <table>
     <tr>
       <th>Звездность</th>
       <th>Название</th>
     </tr>
    
     <g:each in="${hotels}" var="h">
      <tr>
        <td>${h.stars}</td>
        <td>${h.name}
        <g:if test="${h.website != null}">
    <br><a href="${h.website}" target="_blank">Перейти на сайт</a>
</g:if>
</td>
      </tr>
     </g:each>
    </table>
    <g:link action="index">
    <button type="button">Новый поиск</button>
</g:link>

<br>
<g:set var="paginationController" value="search"/>
<g:set var="paginationAction" value="search"/>
<g:set var="extraParams" value="${[query: query, countryId: countryId]}"/>
<g:applyLayout name="pagination" content="pagination"/>
</g:else>
    </body>
</html>
