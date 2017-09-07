package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.model.User;

public class UserMap implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rn) throws SQLException {
		User u = new User();
		u.setUsername(rs.getString(1));
		u.setPassword(rs.getString(2));
		u.setCity(rs.getString(3));
		return u;
	}

}
