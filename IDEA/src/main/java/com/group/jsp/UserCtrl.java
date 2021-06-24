package com.group.jsp;

import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserCtrl {
    private UserCtrl() {
    }

    public static boolean isSignIn(HttpSession session) throws SQLException {
        String email = (String) session.getAttribute("email");
        if (email == null) {
            return false;
        }
        else {
            return DbInstance.emailExist(email);
        }
    }

    // Sign-in.
    // Return token
    public static void signIn(HttpSession session, String email, String password)
            throws SQLException, IllegalArgumentException
    {
        String passDigest = Utils.encode(password);
        String where = "where " +
                String.format("email = '%s'", email) +
                " AND " +
                String.format("password = '%s'", passDigest);
        boolean now = DbAccessor.getData("select * from users " + where,
                ResultSet::next);
        if (!now) {
            throw new IllegalArgumentException("incorrect username or password");
        }
        session.setAttribute("email", email);
    }

    // Register a user.
    public void signUp(String username, String password, String email) {
    }

    public boolean destoryAccount(long uid) {
        return true;
    }

    // Excute precudure corresponding to forget password.
    // Return 1 on successfully sending email & register a special token for
    // resetting password, -SYS_ERR on system error, -USR_ERR on user error.
    public int forgetPasswdProcedure(String email) {
        return 0;
    }
}
