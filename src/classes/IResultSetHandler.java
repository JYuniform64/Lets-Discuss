package com.group.jsp;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface IResultSetHandler<T> {
    public T f(ResultSet rs) throws SQLException;
}
