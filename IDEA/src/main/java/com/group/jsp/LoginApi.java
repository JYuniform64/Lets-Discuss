package com.group.jsp;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

class LoginResult {
    private boolean success = false;
    private String message = "";
    LoginResult(boolean _success, String _message) {
        this.success = _success;
        this.message = _message;
    }
}

@WebServlet(name = "LoginApi", value = "/LoginApi")
@MultipartConfig
public class LoginApi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        String email = Utils.partToString(request.getPart("email"));
        String pass = Utils.partToString(request.getPart("password"));
        try {
            UserCtrl.signIn(request.getSession(), email, pass);
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            out.println(gson.toJson(new LoginResult(true, "")));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (IllegalArgumentException i) {
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            out.println(gson.toJson(new LoginResult(false, i.getMessage())));
        }
    }
}
