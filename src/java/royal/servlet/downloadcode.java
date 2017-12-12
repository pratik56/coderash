/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package royal.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import royal.database.databaseconn;
import java.lang.Runtime;

/**
 *
 * @author Ashutosh
 */
@WebServlet(name = "downloadcode", urlPatterns = {"/downloadcode"})
public class downloadcode extends HttpServlet {

    boolean isWindows = System.getProperty("os.name")
  .toLowerCase().startsWith("windows");
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
        databaseconn d = new databaseconn();
        String participant_name = request.getParameter("participant_name");
        String unique_event_id = request.getParameter("unique_event_id");
        try (PrintWriter out = response.getWriter()) {
            try {
                d.set_sqlstatement("SELECT QUESTION_NUMBER, CODE FROM CODERRASH.\"CODE_BASE\" where \"UNIQUE_EVENT_ID\" = ? and  \"PARTICIPANT\" = ?");
                Map<Integer, Object> param_1 = new HashMap<>();
                param_1.put(1, unique_event_id);
                param_1.put(2, participant_name);
                d.set_sqlparameters(param_1);
                d.process_select_Query();
                String output = "";
                createdir(participant_name);
                while (d.rs.next()) {
                    output = output + "\n\n\n\n Question: " + d.rs.getString("QUESTION_NUMBER");
                    output = output + "\n\n Code: \n\n" + d.rs.getString("CODE");
                    PrintWriter writer = new PrintWriter("../tmp/"+participant_name+"/code"+d.rs.getString("QUESTION_NUMBER")+".java", "UTF-8");
                    writer.println(d.rs.getString("CODE"));
                    writer.close();
                    
                }
                if (output == "") {
                    output = "None Submitted";
                }
                
                String comp = compile(participant_name);
                output = output + "\n\nCompile status\n\n";
                output = output + comp;
                
                String output1 = runcode(participant_name);
                output = output + "\n\nOutput\n\n";
                output = output + output1;
                
                out.print(output);
            } catch (Exception ex) {
                Logger.getLogger(finddatabaseentries.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                d.invalidate();
            }
        }
                
        
    }
public String runcode(String participant_name) throws IOException{
    if(!isWindows){
    Process p = null;
        ProcessBuilder pb = new ProcessBuilder("/bin/sh","runn.sh");
 pb.directory(new File("../tmp/"+participant_name));
        try {
            p = pb.start();
        } catch (IOException ex) {
            Logger.getLogger(downloadcode.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        StringBuffer outp = new StringBuffer();
        BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line="";
        while ((line = reader.readLine())!= null) {
                                outp.append(line + "\n");
        }
        System.out.println("### " + outp);
        String ret = outp +"";
        return ret;
    }
    else{
        Process p = null;
        ProcessBuilder pb = new ProcessBuilder("cmd.exe","runw.bat");
 pb.directory(new File("../tmp/"+participant_name));
        try {
            p = pb.start();
        } catch (IOException ex) {
            Logger.getLogger(downloadcode.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        StringBuffer outp = new StringBuffer();
        BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String line="";
        while ((line = reader.readLine())!= null) {
                                outp.append(line + "\n");
        }
        System.out.println("### " + outp);
        String ret = outp +"";
        return ret;
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
        processRequest(request, response);
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

    private String compile(String participant_name) throws IOException {
        
        if(!isWindows){
        Process p = null;
        ProcessBuilder pb = new ProcessBuilder("/bin/sh","compile.sh");
        pb.directory(new File("../tmp/"+participant_name));
        try {
            p = pb.start();
        } catch (IOException ex) {
            Logger.getLogger(downloadcode.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        StringBuffer outp = new StringBuffer();
        BufferedReader reader = new BufferedReader(new InputStreamReader(p.getErrorStream()));
        String line="";
        while ((line = reader.readLine())!= null) {
                                outp.append(line + "\n");
        }
        System.out.println("!!! " + outp);
        String ret = outp +"";
        return ret;
        }
        else{
            Process p = null;
        ProcessBuilder pb = new ProcessBuilder("cmd.exe","compilew.bat");
        pb.directory(new File("../tmp/"+participant_name));
        try {
            p = pb.start();
        } catch (IOException ex) {
            Logger.getLogger(downloadcode.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        StringBuffer outp = new StringBuffer();
        BufferedReader reader = new BufferedReader(new InputStreamReader(p.getErrorStream()));
        String line="";
        while ((line = reader.readLine())!= null) {
                                outp.append(line + "\n");
        }
        System.out.println("!!! " + outp);
        String ret = outp +"";
        return ret;
        }
        
    }

    private void createdir(String partname) throws IOException {
        File dir = new File("../tmp");
        boolean success = dir.mkdir();
        if(success){
            System.out.println("Directory successfully created");
        }
        else{
            System.out.println("Directory not created");
        }
        File dir1 = new File("../tmp/"+partname);
        boolean success1 = dir1.mkdir();
        if(success1){
            System.out.println("Directory successfully created");
        }
        else{
            System.out.println("Directory not created");
        }
        
        if(!isWindows){
        String cmd = "cp runn.sh ../tmp/"+partname;
        Runtime run = Runtime.getRuntime();
        run.exec(cmd);
        
        String cmd1 = "cp compile.sh ../tmp/"+partname;
        Runtime run1 = Runtime.getRuntime();
        run1.exec(cmd1);
        }
        else{
            String cmd = "copy runw.bat ../tmp/"+partname;
        Runtime run = Runtime.getRuntime();
        run.exec(cmd);
        
        String cmd1 = "copy compilew.bat ../tmp/"+partname;
        Runtime run1 = Runtime.getRuntime();
        run1.exec(cmd1);
        }
        
    }

}
