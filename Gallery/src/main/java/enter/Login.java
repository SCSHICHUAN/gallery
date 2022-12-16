package enter;

import DAO.DaoCallery;
import DAO.DaoFactory;
import Model.CalloryItem;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


public class Login {

    private DaoCallery daoCallery = DaoFactory.getInstance().initDaoObject(DaoCallery.class);

    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("-------login------");
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        if (username.equals("1") && password.equals("1")) {
            request.getSession().setAttribute("login", username);
            Controller controller = new Controller();
            controller.galleryList(request,response);
        } else {
            response.sendRedirect("/");
        }
    }
}
