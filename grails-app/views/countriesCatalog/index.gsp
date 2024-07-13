<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <meta charset="utf-8">
        <title>Справочник стран</title>
    
    </head>
    <body>
    <g:applyLayout name="menuBar" content="menuBar"/>
    
  <table>
     <tr>
        <th>Страна</th>
        <th>Столица</th>
        <th>Действия</th>
     </tr>
     <tr id="create_row_base"><td></td><td></td><td><button onclick="create()">Добавить страну</button></td></tr>
     <tr id="create_row_create" class="collapse">
     <g:form action="save" method="post" controller="countriesCatalog" params="${[id:null]}">
      <td> <g:textField name="name" type="text" placeholder="" value="${params.name}" /></td>
        <td> <g:textField name="capital" type="text" placeholder="" value="${params.capital}" /></td>
        <td>
             <button type="submit"  id="FormButton">Сохранить</button>           
             <button type="button" onclick="createCancel()">Отменить</button>
        </td>
        </g:form>
     </tr>
     <g:each in="${countries}" var="c">
      <tr id="${c.id + "_base"}">
        <td>${c.name}</td>
        <td>${c.capital}</td>
        <td>
            <button onclick="edit('${c.id}')">Изменить</button>
            <g:form controller="countriesCatalog" action="delete" method="delete" params="${[id:c.id, name:c.name, capital:c.capital]}">
  <button type="submit" id="FormButton">Удалить</button>
</g:form>
        </td>

      </tr >
      <tr id="${c.id + "_edit"}" class="collapse">
      <g:form action="update" method="put" controller="countriesCatalog" params="${[id:c.id]}">
      <td> <g:textField name="name" type="text" placeholder="" value="${c.name}" /></td>
        <td> <g:textField name="capital" type="text" placeholder="" value="${c.capital}" /></td>
        <td>
             <button type="submit"  id="FormButton">Сохранить</button>           
             <button type="button" onclick="editCancel('${c.id}')">Отменить</button>
        </td>
        </g:form>
      </tr>
     </g:each>
    </table>
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
