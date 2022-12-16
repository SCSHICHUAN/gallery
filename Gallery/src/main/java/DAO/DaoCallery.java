package DAO;

import Model.CalloryItem;
import Model.Category;
import com.mysql.jdbc.Buffer;
import org.apache.ibatis.annotations.*;



import java.util.List;

/**
 * 接口是给java来实现的
 */
public interface DaoCallery {


    @Insert("insert into gallery(categoryId,name,creater,price,createTime,updateTime,imgPath,descroption,details,sourceType) " +
            "values(#{categoryId},#{name},#{creater},#{price},#{createTime},#{updateTime},#{imgPath},#{descroption},#{details},#{sourceType})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public void add(CalloryItem item);

/**
 * 方法一  join
 * 使用的是链接查询
 * column = "categoryId"，主表会把查询结果作为参数传给链接查询的语句、
 * @one @mayn
 * column 对应数据库， property 对应实类属性
 */

//    @Select("select * from gallery")
//    @Results(id = "galleryRelt", value = {
//            @Result(id = true, column = "id", property = "id"),
//            @Result(column = "categoryId", property = "categoryId"),
//            @Result(column = "name", property = "name"),
//            @Result(column = "creater", property = "creater"),
//            @Result(column = "price", property = "price"),
//            @Result(column = "createTime", property = "createTime"),
//            @Result(column = "updateTime", property = "updateTime"),
//            @Result(column = "image", property = "image"),
//            @Result(column = "descroption", property = "descroption"),
//            @Result(column = "details", property = "details"),
//            @Result(column = "categoryId",property = "category", one = @One(select = "cate"))
//    })
//    public List<CalloryItem> showItem();
//    @Select("select name from category where id = #{id}")
//    public String cate(int id);


    /**
     * 方法二  join
     * 多表联查 使用join时要注意临时的字段(column)。以下的临时字段为"cName"
     * "cName" 不用别名的形式，结果集无法映射。 g 为主表，c为附表
     *
     * @return
     */
    @Select("select g.*,c.name cName from gallery g left join category c on g.categoryId = c.id order by g.id desc")
    @Results(id = "galleryRelt", value = {
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "categoryId", property = "categoryId"),
            @Result(column = "name", property = "name"),
            @Result(column = "creater", property = "creater"),
            @Result(column = "price", property = "price"),
            @Result(column = "createTime", property = "createTime"),
            @Result(column = "updateTime", property = "updateTime"),
            @Result(column = "image", property = "image"),
            @Result(column = "descroption", property = "descroption"),
            @Result(column = "details", property = "details"),
//            @Result(column = "sourceType", property = "sourceType"),
            @Result(column = "cName", property = "category.name")
    })
    public List<CalloryItem> showItems();


//    @Select("select image from gallery where id = #{id}")
//    public Buffer getImgById(int id);


    @Insert("insert into category(name,createTime,updateTime,description)" +
            "values(#{name},#{createTime},#{updateTime},#{description})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public void addCategory(Category category);

    @Select("select * from category")
    public List<Category> getCategorys();

    @Delete("delete from gallery where id = #{id}")
    public int deleteGallery(Integer id);

    @Select("select g.*,c.name cName from gallery g left join category c on g.categoryId = c.id where g.id=#{id}")
    @ResultMap("galleryRelt")
    public CalloryItem selectCalloryById(int id);


    /**
     * 这个接口写好好后会隐性的实现mybits，给你一个类去调用
     * 数据库和java实体类的映射关系
     * <mapper namespace="com.damu.entity.Users">
     * sqlSession 执行mapper里的语句，语句靠ID区分 这是就是mybits
     * @param item
     * @param image
     * @return
     */
//    @Update("<script>update gallery set categoryId=#{item.categoryId},name=#{item.name},creater=#{item.creater}," +
//            "price=#{item.price},updateTime=#{item.updateTime},descroption=#{item.descroption},details=#{item.details}" +
//            "<if test=\"item.image != null\">,image = #{item.image} </if>" +
//            "where id = #{item.id}</script>")
//    public int updataGallery(@Param("item")CalloryItem item,@Param("image")byte[] image);

    @Update("<script>update gallery set categoryId=#{categoryId},name=#{name},creater=#{creater}," +
            "price=#{price},updateTime=#{updateTime},descroption=#{descroption},details=#{details},sourceType=#{sourceType}" +
            "<if test=\"imgPath != null\">,imgPath = #{imgPath} </if>" +
            "where id = #{id}</script>")
    public int updataGallery(CalloryItem item);


}
