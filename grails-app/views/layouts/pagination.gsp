<div class="container w-100">
<div class="row">
<div class="col self-align-center text-center">
<g:set var="i" value="${page - 2}" />
<g:set var="lastPage" value="${count / 10 + (count % 10 > 0 ? 1 : 0)}"/>
<g:if test="${ i > 1 }">
   <g:link controller ="${paginationController}" action="${paginationAction}" params="${[page:1] + extraParams}">
            <button type="button"><<</button>
        </g:link>
</g:if>
<g:while test="${i <= lastPage && i <= page + 2}">
<g:if test="${ i > 0 }">

    <g:if test="${i == page}">
        <button type="button" disabled>${i++}</button>
    </g:if>
    <g:else>
        <g:link controller ="${paginationController}" action="${paginationAction}" params="${[page:i] + extraParams}">
            <button type="button">${i++}</button>
        </g:link>
    </g:else>
    </g:if><g:else>
       <g:set var="i" value="${i + 1}" />
    </g:else>
</g:while>
<g:if test="${ i <= lastPage }">
   <g:link controller ="${paginationController}" action="${paginationAction}" params="${[page:lastPage] + extraParams}">
            <button type="button">>></button>
        </g:link>
</g:if>
</div></div>
</div>