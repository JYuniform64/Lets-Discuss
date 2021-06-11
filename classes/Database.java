package com.group.jsp;

public interface Database {
    // Get uid corresponds to a certain username.
    public long getUid(String username);

    // Get username corresponds to a certain uid.
    public String getUsername(long uid);

    // Get uid by a **valid** email.
    // Should be used by 'email' module.
    public long getUidByEmail(String email);

    // Get uid by a **valid** token.
    public long getUidByToken(long token);

    // Judge whether a username already exists.
    // Should be used in **SignUp**.
    public boolean usernameExist(String username);

    // Judge whether a email already exists.
    // Should be used in **SignUp**.
    public boolean emailExist(String email);
}
