package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Patient sign up page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");
session.invalidate();
      out.write("\n");
      out.write("        <a href=\"HomePage.html\">Home page</a>\n");
      out.write("        <h1>Sign up:</h1>\n");
      out.write("        <p>This is the sign up page. Please enter your details below. Once\n");
      out.write("        submitted, an administrator will approve or reject your application.</p>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <form action=\"SignUpServlet\" method=\"post\">\n");
      out.write("            First Name: <input type=\"text\" name=\"fName\" required>\n");
      out.write("            <br>\n");
      out.write("            Surname: <input type=\"text\" name=\"sName\" required>\n");
      out.write("            <br>\n");
      out.write("            Password: <input type=\"password\" name=\"pwd\" required>\n");
      out.write("            <br>\n");
      out.write("            Address: <input type= \"address\" name=\"address\" id=\"address\" required>\n");
      out.write("            <button type=\"button\" onclick=\"userAction()\">Lookup</button>\n");
      out.write("            <br>\n");
      out.write("            NHS <input type=\"radio\" id=\"NHS\" name=\"serviceType\" value=\"NHS\" checked>\n");
      out.write("            Private <input type=\"radio\" id=\"private\" name=\"serviceType\" value=\"Private\">\n");
      out.write("            <br>\n");
      out.write("            <input type=\"submit\" value=\"SignUp\">\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            \n");
      out.write("            // Function call to api on button press.\n");
      out.write("            const userAction = async () => {\n");
      out.write("                \n");
      out.write("                var address = document.getElementById('address').value\n");
      out.write("                \n");
      out.write("                // Get response from api and set to json object\n");
      out.write("                const response = await fetch('https://nominatim.openstreetmap.org/search?q='+address+'&polygon_geojson=1&format=geocodejson&countrycodes=gb');\n");
      out.write("                const myJson = await response.json(); //extract JSON from the http response\n");
      out.write("                \n");
      out.write("                // Output json\n");
      out.write("                var str = JSON.stringify(myJson, null, 2);\n");
      out.write("                \n");
      out.write("                // Output full address\n");
      out.write("                document.getElementById(\"output\").innerHTML = myJson.features[0].properties.geocoding['label'];\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
