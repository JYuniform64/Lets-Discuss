package com.group.jsp;

import java.util.Date;

public class Class {
    public final int id;
    public String name;
    public String description;
    public Date date_begin;
    public Date date_end;
    public int teacher_id;

    public Class(int id, String name, String description,
                 Date date_begin, Date date_end, int teacher_id)
    {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date_begin = date_begin;
        this.date_end = date_end;
        this.teacher_id = teacher_id;
    }

    public Class makeNewClass(String name, String description, Date begin, Date end, int teacher_id)
    {
        return new Class(Utils.makeId(), name, description, begin, end, teacher_id);
    }
}
