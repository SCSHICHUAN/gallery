package DAO;

import enter.Controller;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;


public class DaoFactory {

    private static DaoFactory factory;
    private SqlSessionFactory sqlSessionFactory;

    /**
     * 在getInstance是走初始化sqlSessionFactory
     */
    private DaoFactory(){
        try {
            sqlSessionFactory =new SqlSessionFactoryBuilder()
                    .build(Resources.getResourceAsReader("/mybatis.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static DaoFactory getInstance(){
        if(factory == null){
            factory = new DaoFactory();
        }
        return factory;
    }
    public <T> T initDaoObject(Class<T> tClass){
        /**
         * ture 每次执行完sql都提交
         */
        return sqlSessionFactory.openSession(true).getMapper(tClass);
    }

}
