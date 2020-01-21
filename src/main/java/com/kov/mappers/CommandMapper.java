package com.kov.mappers;

import com.kov.entity.Command;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommandMapper implements RowMapper<Command> {
    @Override
    public Command mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Command(rs.getString(1), rs.getString(2));
    }
}