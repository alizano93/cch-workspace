<#--
Web content templates are used to lay out the fields defined in a web
content structure.

Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->
<div id="contacto" class="container-fluid">
    <#if Contacto.getSiblings()?has_content>
    <div class="container-fluid">
        <ol>
        <#list Contacto.getSiblings() as contacto>
            <li> 
                <a href="$Contacto.Url}"><img class="profile-image img-circle" src="${contacto.Imagen.getData()}"/><span class="contact-span">${contacto.Etiqueta.getData()}</span></a>
            </li>
        </#list>
        </ol>
    </div>
    </#if>
</div>