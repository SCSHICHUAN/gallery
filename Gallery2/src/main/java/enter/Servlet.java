package enter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@WebServlet(name = "Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("-----------Servlet---------");
        String path = request.getServletPath();
        path = path.substring(1);
        String pathClass = path.substring(0, path.indexOf("/"));
        System.out.println("pathClass= " + pathClass);
        String pathMethod = path.substring(pathClass.length() + 1, path.indexOf("."));
        System.out.println("pathMethod= " + pathMethod);


        String className = "enter." + pathClass;

        try {

            /**
             * 利用java反射来分发请求
             */
            Class aClass = Class.forName(className);
            Constructor constructor = aClass.getConstructor();
            Object obj = constructor.newInstance();
            Method method = obj.getClass().getDeclaredMethod(pathMethod, HttpServletRequest.class, HttpServletResponse.class);
            method.setAccessible(true);
            method.invoke(obj, request, response);


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
