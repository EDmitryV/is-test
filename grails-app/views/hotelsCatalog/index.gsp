<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <meta charset="utf-8">
        <title>Справочник отелей</title>
    
    </head>
    <body>
    <g:applyLayout name="menuBar" content="menuBar"/>
    
  <table>
     <tr>
        <th>Звездность</th>
       <th>Название</th>
        <th>Действия</th>
     </tr>
     <tr id="create_row_base"><td></td><td></td><td><button onclick="create()">Добавить отель</button></td></tr>
     <tr id="create_row_create" class="collapse">
     <g:form action="save" method="post" controller="hotelsCatalog" params="${[id:null]}">
     <td> 
     <g:select name="stars" from="${1..5}" value="${params.stars}"/></td>
      <td><label>Отель:</label> <g:textField name="name" type="text" placeholder="" value="${params.name}" /><br><label>Страна:</label> <g:select name="country" id="country" from="${countries}" value="${params.country}" optionKey="id" optionValue="name"
                        /><br><label>Сайт:</label><g:textField name="website" type="text" placeholder="" value="${params.website}" /></td>
        <td>
             <button type="submit"  id="FormButton">Сохранить</button>           
             <button type="button" onclick="createCancel()">Отменить</button>
        </td>
        </g:form>
     </tr>
     <g:each in="${hotels}" var="h">
      <tr id="${h.id + "_base"}">
        <td>${h.stars}</td>
        <td>${h.name} <br>${h.country.name}<g:if test="${h.website != null}">
    <br><a href="${h.website}" target="_blank">Перейти на сайт</a>
</g:if></td>
        <td>
            <button onclick="edit('${h.id}')">Изменить</button>
            <g:form controller="hotelsCatalog" action="delete" method="delete" params="${[id:h.id, name:h.name, stars:h.stars, country:h.country]}">
  <button type="submit" id="FormButton">Удалить</button>
</g:form>
        </td>

      </tr >
      <tr id="${h.id + "_edit"}" class="collapse">
      <g:form action="update" method="put" controller="hotelsCatalog" params="${[id:h.id]}">
      <td> <g:select name="stars" from="${1..5}" value="${h.stars}"/></td>
        <td> <label>Отель:</label><g:textField name="name" type="text" placeholder="" value="${h.name}" /><br> <label>Страна:</label><g:select name="country" id="country" from="${countries}" value="${h.country}" optionKey="id" optionValue="name"
                        /><br><label>Сайт:</label><g:textField name="website" type="text" placeholder="" value="${h.website}" /></td>
        <td>
             <button type="submit"  id="FormButton">Сохранить</button>           
             <button type="button" onclick="editCancel('${h.id}')">Отменить</button>
        </td>
        </g:form>
      </tr>
     </g:each>
    </table>
    <g:set var="paginationController" value="hotelsCatalog"/>
<g:set var="paginationAction" value="index"/>
<g:set var="extraParams" value="${[]}"/>
<g:applyLayout name="pagination" content="pagination"/>
    <script>
    function edit(id) {
    document.getElementById(id+"_edit").classList.remove('collapse');
    document.getElementById(id+"_base").classList.add('collapse');
  }
  function editCancel(id){
    document.getElementById(id+"_edit").classList.add('collapse');
    document.getElementById(id+"_base").classList.remove('collapse');
  }
  function create(){
    document.getElementById("create_row_base").classList.add('collapse');
    document.getElementById("create_row_create").classList.remove('collapse');
  }
  function createCancel(){
document.getElementById("create_row_base").classList.remove('collapse');
    document.getElementById("create_row_create").classList.add('collapse');
  }
    </script>
    </body>
</html>
