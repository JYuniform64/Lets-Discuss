package com.group.jsp;

import java.util.Date;

public class Answer {
    public int id;
    public int question_id;
    public Date date;
    public int user_id;
    public String content;

    public Answer(int id, int question_id, Date date, int user_id, String content) {
        this.id = id;
        this.question_id = question_id;
        this.date = date;
        this.user_id = user_id;
        this.content = content;
    }

    public static Answer makeNewAnswer(int question_id, Date date, int user_id, String content) {
        return new Answer(
                Utils.makeId(), question_id, date, user_id, content
        );
    }
}
