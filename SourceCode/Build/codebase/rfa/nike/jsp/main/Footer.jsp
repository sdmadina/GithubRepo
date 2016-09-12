<%-- Copyright (c) 2002 PTC Inc.   All Rights Reserved --%>

<%@ page language="java"
        import="java.util.*,
                com.lcs.wc.util.*,
                com.lcs.wc.client.web.PageManager,
                java.io.*,
                wt.util.*"
%>

<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
<%-- ////////////////////////////// INCLUDED FILES  //////////////////////////////////////--%>
<%-- /////////////////////////////////////////////////////////////////////////////////////--%>

<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
<%-- //////////////////////////////// BEAN INITIALIZATIONS ///////////////////////////////--%>
<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
<jsp:useBean id="lcsContext" class="com.lcs.wc.client.ClientContext" scope="session"/>
<jsp:useBean  id="url_factory" class="wt.httpgw.URLFactory" scope="request" />
<jsp:useBean id="wtcontext" class="wt.httpgw.WTContextBean" scope="request"/>
<jsp:setProperty name="wtcontext" property="request" value="<%=request%>"/>
<% wt.util.WTContext.getContext().setLocale(wt.httpgw.LanguagePreference.getLocale(request.getHeader("Accept-Language")));%>
<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
<%-- ////////////////////////////// INITIALIZATION JSP CODE //////////////////////////////--%>
<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
<%!

	public static final String subURLFolder = LCSProperties.get("flexPLM.windchill.subURLFolderLocation");
    public static final String STANDARD_TEMPLATE_HEADER = PageManager.getPageURL("STANDARD_TEMPLATE_HEADER", null);
    public static final String STANDARD_TEMPLATE_FOOTER = PageManager.getPageURL("STANDARD_TEMPLATE_FOOTER", null);
    public static final String defaultContentType = LCSProperties.get("com.lcs.wc.util.CharsetFilter.ContentType","text/html");
    public static final String defaultCharsetEncoding = LCSProperties.get("com.lcs.wc.util.CharsetFilter.Charset","UTF-8");
    public static final String URL_CONTEXT = LCSProperties.get("flexPLM.urlContext.override");
    public static final boolean BASELINE_INSTALLED;
    public static final String WEBHOME = LCSProperties.get("flexPLM.webHome.location","\\codebase\\rfa");

    public static String VERSION = FlexVersionInfo.VERSION;
    
    static {
        BASELINE_INSTALLED = LCSProperties.getBoolean("com.lcs.baseline.Enabled");        
    }
%>
<%
response.setDateHeader("Expires", -1);
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

response.setContentType( defaultContentType+"; charset=" +defaultCharsetEncoding);

String poweredBy = WTMessage.getLocalizedMessage ( RB.MAIN, "poweredBy_LBL",RB.objA ) ;
String copyrightLabel = WTMessage.getLocalizedMessage (RB.MAIN, "copyright_LBL", RB.objA ) ;
String allRightsReserved = WTMessage.getLocalizedMessage ( RB.MAIN, "allRightsReserved_LBL",RB.objA ) ;
String FlexVersionLabel = WTMessage.getLocalizedMessage (RB.MAIN, "FlexVersion_LBL", RB.objA ) ;
String BaseLineVersionLabel = WTMessage.getLocalizedMessage (RB.MAIN, "BaseLineVersion_LBL", RB.objA ) ;
%>

<jsp:include page="<%=subURLFolder+ STANDARD_TEMPLATE_HEADER %>" flush="true" />
         <table border="0" width="100%" cellpadding="0" cellspacing="0" class="FOOTERBAR">
                <tr>
                    <td>
                        <center>
                        <span class="FOOTERBARTEXT">PTC® FlexPLM® <%= VERSION %>
                        </span>
                        &nbsp; &nbsp; &nbsp;
                        <span class=FOOTERBARTEXT>
                            <%= poweredBy %>  <A class="FOOTERBARTEXT" href="javascript:openPage('http://www.ptc.com/product/windchill');">PTC® Windchill®</a>
                        </span>
                        &nbsp; &nbsp; &nbsp;
<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
<%-- /////////////////////////////////////// JAVSCRIPT ///////////////////////////////////--%>
<%-- /////////////////////////////////////////////////////////////////////////////////////--%>
                        <span class="FOOTERBARTEXT"><%= copyrightLabel%> © 2016 <A class="FOOTERBARTEXT" href="javascript:openPage('http://www.ptc.com/');">PTC Inc.</A>  <%= allRightsReserved %> Nike DevOps POC
                        </span>

                        </center>
                    </td>
               </tr>
            </table>
<jsp:include page="<%=subURLFolder+ STANDARD_TEMPLATE_FOOTER %>" flush="true" />

<script>
    function openPage(url){
        window.open(url);
    }
</script>