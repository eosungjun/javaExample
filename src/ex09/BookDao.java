package ex09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * getBookList() : 도서 목록 조회
 * insertBook() : 도서 등록
 */
public class BookDao {
    
    public static void main(String[] args) {

        BookDao dao = new BookDao();
        
        List<Book>list = dao.getBooklList();

        for(Book book : list){
            System.out.println(book);
        }

        
    }

    public int insertBook(){

        int res = 0;
        String sql = "INSERT INTO TB_BOOK (B_NO, TITLE, AUTHOR, P_NO) "
                + "VALUES('B'||lpad( seq_tb_book.nextval,5,0), 'insertBook', '삽입테스트', 'P00003')";

        try {
            Connection con = ConnectionUtil.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            res = pstmt.executeUpdate();
            
        } catch (SQLException e) {
            
        }
        return res;

    }


    public List<Book> getBooklList(){

        List<Book>list = null;

        try {

            Connection con = ConnectionUtil.getConnection();
            PreparedStatement pstmt = con.prepareStatement("select * from tb_book");
            ResultSet rs = pstmt.executeQuery();

            list= new ArrayList<Book>();

            while(rs.next()){

                String b_no = rs.getString("b_no");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String rentyn = rs.getString("rentyn");

                Book book = new Book(b_no, title, author, rentyn);
                list.add(book);


            }

            ConnectionUtil.closeConnection(rs, pstmt, con);
            
        } catch (SQLException e) {
            // TODO: handle exception
        }
        return list;


    }


    
    
    








}
