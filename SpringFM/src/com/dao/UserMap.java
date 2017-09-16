package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.model.User;

public class UserMap implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rn) throws SQLException {
		User u = new User();
		u.setId(rs.getInt(1));
		u.setFname(rs.getString(2));
		u.setLname(rs.getString(3));
		u.setUsername(rs.getString(4));
		u.setPassword(rs.getString(5));
		u.setEmail(rs.getString(6));
		u.setContact(rs.getLong(7));
		u.setCity(rs.getString(8));
		u.setPincode(rs.getString(9));
		u.setUser(rs.getString(10));
		u.setAdmin(rs.getBoolean(11));
		u.setFromBy(rs.getInt(12));
		return u;
	}
	
}
