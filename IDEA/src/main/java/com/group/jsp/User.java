package com.group.jsp;

public class User {
    enum Types {
        Student(0),
        Teacher(1),
        Admin(2);
        private final int value;
        Types(int value) {
            this.value = value;
        }
        public int getValue() {
            return value;
        }
    }
    public int id;
    public String name;
    public String email;
    public String pass;
    public Types type;

    User(int id, String name, String email, String pass, Types type) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.pass = pass;
        this.type = type;
    }

    public static User makeNewUser(String name, String email, String pass, Types type) {
        return new User(
                Utils.makeId(), name, email, pass, type
        );
    }

    public static Types parseTypes(int i) {
        switch (i) {
            case 0:
                return Types.Student;
            case 1:
                return Types.Teacher;
            case 2:
                return Types.Admin;
            default:
                return Types.Student;
        }
    }
}
