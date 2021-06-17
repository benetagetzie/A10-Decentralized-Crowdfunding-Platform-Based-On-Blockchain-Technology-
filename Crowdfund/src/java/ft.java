/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.commondb.Common_DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bless
 */
public class ft extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ft</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ft at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String s0=request.getParameter("fname");
        String s1=request.getParameter("frname");
        String s2=request.getParameter("email");
        String s3=request.getParameter("accno");
        String s4=request.getParameter("amount");
        String s5=request.getParameter("time");
        int total;
        System.out.println(s4);
        
        long millis=System.currentTimeMillis();  
            java.sql.Date cdate=new java.sql.Date(millis);  
            System.out.println(cdate);
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdfund","root","password");
            PreparedStatement ps=con.prepareStatement("insert into transaction values(?,?,?,?,?,?,?)");
            ps.setString(1, s0);
            ps.setString(2, s1);
            ps.setString(7, s2);
            ps.setString(3, s3);
            ps.setString(4, s4);
            ps.setDate(5, cdate);
            ps.setString(6, s5);
            ps.executeUpdate();
             try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdfund","root","password");
            Statement st = con1.createStatement();
            ResultSet rs = st.executeQuery("select * from fund where name = '"+s1+"'");
            if(rs.next()){
                
                String amount = rs.getString("amount");
                System.out.println(amount);
                int ramt = Integer.parseInt(amount);
                total = Integer.parseInt(s4);
                int full = ramt - total;
                System.out.println(full);
                try{
                    Common_DB.UpdateTable("crowdfund", "update fund set amount='"+full+"' where name='"+s1+"'");  
                     
                }
                catch(Exception e){
                    System.out.println(e);
                }
                response.sendRedirect("donorhomenew.jsp");      
                
            }
            
            
        }
        catch(Exception e){
            System.out.println(e);
        }
           
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println(e);
        }
        
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
