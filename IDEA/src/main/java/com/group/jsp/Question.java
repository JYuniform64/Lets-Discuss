package com.group.jsp;

import java.util.Date;

public class Question {
    public enum Types {
        Question(0),
        POST(1);
        private final int value;
        Types(int value) {
            this.value = value;
        }
        public int getValue() {
            return value;
        }
    }
    public String makeTags() {
        return "";
    }
    public static String[] parseTags(String tags) {
        return new String[0];
    }
    public static Types parseType(int i) {
        switch (i) {
            case 0:
                return Types.Question;
            case 1:
                return Types.POST;
            default:
                return Types.Question;
        }
    }
    public Question(int id, int class_id, String title, String content, String[] tags,
                    Types type, Date create_date, Date modified_date,
                    int response_count, int view_count, int good_question_count,
                    boolean teacher_ask, boolean teacher_answer
                    ) {
        this.id = id;
        this.class_id = class_id;
        this.title = title;
        this.content = content;
        this.tags = tags;
        this.type = type;
        this.create_date = create_date;
        this.modified_date = modified_date;
        this.response_count = response_count;
        this.view_count = view_count;
        this.good_question_count = good_question_count;
        this.teacher_ask = teacher_ask;
        this.teacher_answer = teacher_answer;
    }

    public static Question makeNewQuestion(int class_id, String title, String content, String[] tags, Types type, boolean teacher_ask) {
        Date now = new Date();
        return new Question(
                Utils.makeId(),
                class_id,
                title,
                content,
                tags,
                type,
                now,
                now,
                0,
                0,
                0,
                teacher_ask,
                false
        );
    }


    public final int id;
    public int class_id;
    public String title;
    public String content;
    public String[] tags;
    public Types type;
    public Date create_date;
    public Date modified_date;
    public int response_count;
    public int view_count;
    public int good_question_count;
    public boolean teacher_ask;
    public boolean teacher_answer;
}
