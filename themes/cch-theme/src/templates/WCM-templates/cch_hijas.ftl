<#--
Application display templates can be used to modify the look of a
specific application.

Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->
<#if entries?has_content>
<div id="cchHijas" class="container-fluid">
    <h2> CCH Hijas </h2>
	<#list entries as curEntry>
	    <#assign ImagenPresentación =""/>
	    <#assign pageURL=""/>
		<#assign rootElement = saxReaderUtil.read(curEntry.getAssetRenderer().getArticle().getContentByLocale(locale)).getRootElement() />
		<#list rootElement.elements() as dynamicElement>
             <#if dynamicElement.attributeValue("name") == "imagenPresentacion">
                 <#assign ImagenPresentacion = dynamicElement.element('dynamic-content').getText()/>
             <#elseif dynamicElement.attributeValue("name") == "link">
                 <#assign link = dynamicElement.element('dynamic-content').getText()/> 
                 <#assign parts = link?split("@")/>
                 <#assign layoutLocalService = serviceLocator.findService('com.liferay.portal.kernel.service.LayoutLocalService') />
                <#assign pageLayout = layoutLocalService.getLayout(parts[2]?number, false, parts[0]?number) />
                <#assign pageURL = pageLayout.getFriendlyURL() />
             </#if>
        </#list>
        <#if curEntry?is_even_item?c == "false">
            <div class="row margin25">
                <div class="col-md-6">
                    <div class="row margin25">
                        <img class="img-circle profile-image" src="${ImagenPresentacion}"/>
                    </div>    
                    <div class="row">
                        <a class="btn btn-default" href="${pageURL}">Ver más</a>
                    </div>  
                </div>
        <#else>
                <div class="col-md-6">
                    <div class="row margin25">
                        <img class="img-circle profile-image" src="${ImagenPresentacion}"/>
                    </div>    
                    <div class="row">
                        <a class="btn btn-default" href="${pageURL}">Ver más</a>
                    </div>  
                </div>
            </div>
        </#if>    
	</#list>
</div>
</#if>