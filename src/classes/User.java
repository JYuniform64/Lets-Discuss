package com.group.jsp;

public interface User {
    // Sign-in.
    // Return token(greater than 0) on success, -SYS_ERR on system error, -USR_ERR on
    // user error.
    public long signIn(String email_or_username, String password, boolean is_email);

    // Register a user.
    // Return 1 on success, -SYS_ERR on system error, -USR_ERR on user error.
    public int signUp(String username, String password, String email);

    // Close an account given its uid.
    public boolean destoryAccount(long uid);

    // Excute precudure corresponding to forget password.
    // Return 1 on successfully sending email & register a special token for
    // resetting password, -SYS_ERR on system error, -USR_ERR on user error.
    public int forgetPasswdProcedure(String email);
}
