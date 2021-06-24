package com.group.jsp;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

interface IPrepareStmtHandler {
    void f(PreparedStatement p) throws SQLException;
}

public class DbAccessor {
    private DbAccessor() {
    }

    public static DataSource ds;

    static {
        try {
            HikariConfig config = new HikariConfig();
            config.setJdbcUrl("jdbc:mysql://localhost:3306/mydb");
            config.setUsername("root");
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");
            config.setPassword("");
            config.addDataSourceProperty("connectionTimeout", "1000");
            config.addDataSourceProperty("idleTimeout", "60000");
            config.addDataSourceProperty("maximumPoolSize", "20");
            ds = new HikariDataSource(config);
        } catch (Throwable t) {
            Logger logger = LoggerFactory.getLogger(DbAccessor.class);
            logger.error("error:", t);
            throw t;
        }
    }

    public static DataSource getDs() {
        return ds;
    }

    public static <T> T getData(String query, IResultSetHandler<T> func)
            throws SQLException {
        try (Connection c = getDs().getConnection()) {
            try (Statement stmt = c.createStatement()) {
                try (ResultSet rs = stmt.executeQuery(query)) {
                    return func.f(rs);
                }
            }
        }
    }

    public static <T> List<T> getDataList(String query, IResultSetHandler<T> func)
            throws SQLException {
        return getData(query, rs -> {
            List<T> list = new ArrayList<>();
            while (rs.next()) {
                list.add(func.f(rs));
            }
            return list;
        });
    }

    public static void exec(String query) throws SQLException {
        try (Connection c = getDs().getConnection()) {
            try (Statement stmt = c.createStatement()) {
                stmt.executeUpdate(query);
            }
        }
    }

    public static void execPrepare(String query, IPrepareStmtHandler p) throws SQLException {
        try (Connection c = getDs().getConnection()) {
            try (PreparedStatement stmt = c.prepareStatement(query)) {
                p.f(stmt);
                stmt.executeUpdate();
            }
        }
    }
}
