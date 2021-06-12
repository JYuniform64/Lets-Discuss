package com.group.jsp;

public interface Authentication {
    // Verify whether the given token belong to an Administrator.
    // Return false if either token is invalid or token does not belong to an
    // Administrator.
    public boolean isAdmin(long token);

    // Verify whether the given token belong to a teacher.
    // Return false if either token is invalid or token does not belong to a
    // teacher.
    public boolean isTeacher(long token);

    // Verify whether the given token belong to a student.
    // Return false if either token is invalid or token does not belong to a
    // student.
    public boolean isStudent(long token);

    // Verify whether the given token was once granted by the Authentication service
    // and not yet expired.
    public boolean validToken(long token);

    // Verify whether the given email belongs to a valid user.
    // Should be used by 'email' module.
    public boolean validEmail(String email);

    // Grant a valid token for a given uid while registering the token.
    // If token for the given uid exists, reset the token sliently.
    public long grantToken(long uid);

    /***************************************************************/
    // Verify the given username and password map to a valid user.
    public boolean authSignIn(String username, String password);

    // Register a user.
    public boolean SignUp(String username, String password, String email);

    // Close an account given its uid.
    public boolean destoryAccount(long uid);

    // TODO: business logic on forget password
}