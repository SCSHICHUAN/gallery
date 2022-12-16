package enter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebFilter(filterName = "Filter")
public class Filter implements javax.servlet.Filter {

    private String encoding = "utf-8";

    public void init(FilterConfig config) throws ServletException {

        if (config.getInitParameter("encoding") != null) {
            encoding = config.getInitParameter("encoding");
        }
    }


    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);

        String path = request.getServletPath();
        System.out.println("doFilterPath= " + path);
        if (path.equals("/")) {

            Controller controller = new Controller();
            try {
                controller.galleryShow(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            chain.doFilter(req, resp);
        }

    }

    public void destroy() {
    }

}
