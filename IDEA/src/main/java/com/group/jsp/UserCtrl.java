package com.group.jsp;

import java.sql.ResultSet;
import java.sql.SQLException;


public class UserCtrl {
    private UserCtrl() {
    }

    // Sign-in.
    // Return token
    public static void signIn(String email_or_username, String password, boolean is_email)
            throws SQLException, IllegalArgumentException
    {
        String passDigest = Utils.encode(password);
        String where = "where " +
                String.format((is_email) ? "email = '%s'" : "username = '%s'", email_or_username) +
                " AND " +
                String.format("password = '%s'", passDigest);
        boolean now = DbAccessor.getData("select * from users " + where,
                ResultSet::next);
        if (!now) {
            throw new IllegalArgumentException("incorrect username or password");
        }
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
