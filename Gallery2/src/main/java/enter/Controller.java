package enter;


import DAO.DaoCallery;
import DAO.DaoFactory;
import Model.CalloryItem;
import Model.Category;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.mysql.jdbc.Buffer;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Controller {

    private int currentPage = 0;



    private DaoCallery daoCallery = DaoFactory.getInstance().initDaoObject(DaoCallery.class);

    public void createCallery(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------creatCallery------------");

        List<Category> categories = daoCallery.getCategorys();
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/WEB-INF/views/add_canvas.jsp").forward(request, response);
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------add------------");


        CalloryItem calloryItem = new CalloryItem();

        if (ServletFileUpload.isMultipartContent(request)) {

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            List<FileItem> items = fileUpload.parseRequest(request);


            Iterator<FileItem> it = items.iterator();
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                if (fileItem.isFormField()) {
                    String fileName = fileItem.getFieldName();

                    if (fileName.equals("name")) {
                        calloryItem.setName(fileItem.getString("utf-8"));
                    } else if (fileName.equals("categoryId")) {
                        calloryItem.setCategoryId(Integer.valueOf(fileItem.getString()));
                    } else if (fileName.equals("price")) {
                        calloryItem.setPrice(Integer.valueOf(fileItem.getString()));
                    } else if (fileName.equals("description")) {
                        calloryItem.setDescroption(fileItem.getString("utf-8"));
                    } else if (fileName.equals("details")) {
                        calloryItem.setDetails(fileItem.getString("utf-8"));
                    }


                } else {
                    calloryItem.setImage(fileItem.get());
                }
            }

            String creater = (String) request.getSession().getAttribute("login");
            calloryItem.setCreater(creater);
            calloryItem.setCreateTime(new Date());
            calloryItem.setUpdateTime(null);
            System.out.println(calloryItem.toString());

            daoCallery.add(calloryItem);

        }

        PageHelper.startPage(currentPage, 10);
        List<CalloryItem> items = daoCallery.showItems();
        PageInfo pageInfo = PageInfo.of(items);
        request.setAttribute("pageInfo", pageInfo);


        request.getRequestDispatcher("/WEB-INF/views/canvas_list.jsp").forward(request, response);

    }

    public void show(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("__________show________");
        List<CalloryItem> calloryItems = daoCallery.showItems();


        for (CalloryItem item : calloryItems) {
            System.out.println(item.getName() + "," + item.getCategory().getName());
        }


//        byte[] image = calloryItems.get(15).getImage();

//        String url = "/Users/SHICHUAN/Desktop/??????????????????/ii.png";
//
//        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(image);
//
//        try {
//            OutputStream outputStream = new FileOutputStream(url);
//            int len = 0;
//            byte[] b = new byte[1024];
//            while ((len = byteArrayInputStream.read(b)) != -1) {
//                outputStream.write(b, 0, len);
//            }
//            byteArrayInputStream.close();
//            outputStream.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

//        try {
//            response.getOutputStream().write(image);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

    }

    public void getImg(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("__________getImg________");

        String id = (String) request.getParameter("id");

        Buffer buffer = daoCallery.getImgById(Integer.parseInt(id));
        byte[] bytes = buffer.getByteBuffer();

        try {
            response.getOutputStream().write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }


//        //??????response??????????????????????????????????????????
//        response.setContentType("multipart/form-data");
//        //??????cake??????null?????????getSmallImg()?????????????????????null
//
//        try {
//            //???????????????????????????????????????????????????
//            InputStream in = new ByteArrayInputStream(bytes);
//            //?????????????????????????????????
//            ServletOutputStream out = response.getOutputStream();
//            //??????byte???????????????
//            byte[] b = new byte[1024];
//            //???????????????????????????
//            int length = in.read(b);
//            while (length != -1) {
//                //???????????????????????????
//                out.write(b);
//                length = in.read(b);
//            }
//            //??????????????????
//            out.flush();
//            //???????????????
//            out.close();
//            //???????????????
//            in.close();
//            //???Buffer????????????????????????
//            response.flushBuffer();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }


    public void toCategory(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("__________toCategory________");
        try {
            request.getRequestDispatcher("/WEB-INF/views/add_category.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void createCategory(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("__________createCategory________");

        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


        String name = (String) request.getParameter("name");
        String description = (String) request.getParameter("description");

        System.out.println(name + "    " + description + "----------");

        Date date = new Date();

        Category category = new Category();
        category.setName(name);
        category.setDescription(description);
        category.setCreateTime(date);
        category.setUpdateTime(date);

        daoCallery.addCategory(category);

        List<Category> categories = daoCallery.getCategorys();
        request.setAttribute("categories", categories);


        try {
            request.getRequestDispatcher("/WEB-INF/views/add_canvas.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void galleryList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("__________galleryList________");

        String pageNum = (String) request.getParameter("pageNum");
        if (pageNum == null) pageNum = "1";


        /***
         * pageHelper
         * 1.?????? ???????????????
         * 2.?????? ??????????????????
         * 3.??????????????????????????????
         * 4.???pageInfo ???????????????
         */
        PageHelper.startPage(Integer.parseInt(pageNum), 10);
        List<CalloryItem> items = daoCallery.showItems();
        PageInfo pageInfo = PageInfo.of(items);
        request.setAttribute("pageInfo", pageInfo);
        currentPage = pageInfo.getPageNum();


        request.getRequestDispatcher("/WEB-INF/views/canvas_list.jsp").forward(request, response);
    }

    public void galleryDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("__________galleryDelete________");

        String id = (String) request.getParameter("id");
        System.out.println("deleteID:" + id + "-----------------");
        daoCallery.deleteGallery(Integer.parseInt(id));

        galleryList(request, response);

    }

    public void galleryEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("__________galleryEdit________");

        String id = (String) request.getParameter("id");
        System.out.println("Edit:" + id + "-----------------");
        CalloryItem gallery = daoCallery.selectCalloryById(Integer.parseInt(id));
        request.setAttribute("gallery", gallery);

        List<Category> categories = daoCallery.getCategorys();
        request.setAttribute("categories", categories);


        for (Category category : categories) {
            System.out.println(category.getName());
        }


        request.getRequestDispatcher("/WEB-INF/views/update_canvas.jsp").forward(request, response);

    }

    public void galleryUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------galleryUpdate------------");


        CalloryItem calloryItem = new CalloryItem();

        if (ServletFileUpload.isMultipartContent(request)) {

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            List<FileItem> items = fileUpload.parseRequest(request);


            Iterator<FileItem> it = items.iterator();
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                if (fileItem.isFormField()) {
                    String fileName = fileItem.getFieldName();

                    if (fileName.equals("id")) {
                        calloryItem.setId(Long.parseLong(fileItem.getString("utf-8")));
                    } else if (fileName.equals("name")) {
                        calloryItem.setName(fileItem.getString("utf-8"));
                    } else if (fileName.equals("categoryId")) {
                        calloryItem.setCategoryId(Integer.valueOf(fileItem.getString()));
                    } else if (fileName.equals("price")) {
                        calloryItem.setPrice(Integer.valueOf(fileItem.getString()));
                    } else if (fileName.equals("description")) {
                        calloryItem.setDescroption(fileItem.getString("utf-8"));
                    } else if (fileName.equals("details")) {
                        if (fileItem.getString("utf-8").equals("")) {
                            calloryItem.setDetails("???");
                        } else {
                            calloryItem.setDetails(fileItem.getString("utf-8"));
                        }

                    }

                } else {

                    if (fileItem.get().length == 0) {
                    } else {
                        calloryItem.setImage(fileItem.get());

                    }
                }
            }


            calloryItem.setUpdateTime(new Date());
            calloryItem.setCreater((String) request.getSession().getAttribute("login"));
            daoCallery.updataGallery(calloryItem, calloryItem.getImage());
            System.out.println(calloryItem.getName());


        }

        PageHelper.startPage(currentPage, 10);
        List<CalloryItem> items = daoCallery.showItems();
        PageInfo pageInfo = PageInfo.of(items);
        request.setAttribute("pageInfo", pageInfo);


        request.getRequestDispatcher("/WEB-INF/views/canvas_list.jsp").forward(request, response);

    }

    public static String getNowDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);

        return dateString;

    }

    public void galleryShow(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------galleryShow------------");
        String page = (String) request.getParameter("pageNum");
        if (page == null) page = "1";

        PageHelper.startPage(Integer.parseInt(page), 6);
        List<CalloryItem>  items = daoCallery.showItems();
        request.getSession().setAttribute("images",items);
        PageInfo pageInfo = PageInfo.of(items);
        request.setAttribute("pageInfo", pageInfo);
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);


    }

    public void admin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------admin------------");
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    public void getImge2(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------getImge2------------");
        String id = (String)request.getParameter("id");

        List<CalloryItem> imageItems = (List<CalloryItem>)request.getSession().getAttribute("images");

        for(CalloryItem calloryItem:imageItems){
            if (calloryItem.getId() == Integer.parseInt(id)){
                try {
                    response.getOutputStream().write(calloryItem.getImage());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }
    public void ditle(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("--------------ditle------------");
        String id = (String)request.getParameter("id");

        CalloryItem calloryItem = daoCallery.selectCalloryById(Integer.parseInt(id));
        request.setAttribute("calloryItem",calloryItem);
        request.getRequestDispatcher("/WEB-INF/views/detail.jsp").forward(request, response);


    }






}
