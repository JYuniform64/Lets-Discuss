package com.group.jsp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;

@WebServlet(name = "UploadApi", value = "/UploadApi")
@MultipartConfig
public class UploadApi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        if (fileName.equals("")) { return; }
        ServletContext context = request.getServletContext();
        String path = context.getRealPath("/files");
        InputStream fileContent = filePart.getInputStream();
        UploadFile f = UploadFile.makeNewUploadFile(fileContent, path, fileName);
        try {
            DbInstance.insertUploadFile(f);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("./resource.jsp");
    }
}
