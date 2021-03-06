package kr.co.offispace.service.menu;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dto.MenuVO;

public interface MenuService {

	public abstract List<MenuVO> getMainMenuList() throws SQLException;

	public abstract List<MenuVO> getAllMenuList() throws SQLException;
	
	public abstract MenuVO getMenuByMcode(String mCode) throws SQLException;

}
