
<div class="row">
<div class="col self-align-center">
<div class="card text-center w-75">
<div class = "card-body">

<g:form action="search" controller="search">
            <div  class="form-group">
                <label for="hotel">Название отеля</label>
                <g:textField id="hotel" class="form-control" name="query" type="text" placeholder="Любое" value='${params.query}' />
            </div>
           <div  class="form-group">
           <label for="country">Страна</label>
           <g:select name="countryId" id="country" class="form-control" from="${countries}" value="${countryInstance?.id}" optionKey="id" optionValue="name" noSelection="${['': 'Любая']}"
                        /></div>
              <div class="container">        
          
                <button type="submit" class="btn btn-primary" id="FormButton" >Найти</button>
                </div>
       
           
        </g:form>
        </div>
        </div>
        </div>
        </div>




