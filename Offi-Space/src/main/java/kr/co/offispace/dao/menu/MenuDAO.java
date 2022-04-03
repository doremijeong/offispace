package kr.co.offispace.dao.menu;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dto.MenuVO;

public interface MenuDAO {

	public abstract List<MenuVO> selectMainMenu() throws SQLException;

	public abstract List<MenuVO> selectAllMenu() throws SQLException;

	public abstract MenuVO selectMenuByMcode(String mCode) throws SQLException;

}
