package kr.co.offispace.service.menu;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dao.menu.MenuDAO;
import kr.co.offispace.dto.MenuVO;

public class MenuServiceImpl implements MenuService{

	private MenuDAO menuDAO;

	public void setMenuDAOBean(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList() throws SQLException {

		List<MenuVO> menuList = menuDAO.selectMainMenu();

		return menuList;
	}

	@Override
	public List<MenuVO> getAllMenuList() throws SQLException {
		List<MenuVO> menuList = menuDAO.selectAllMenu();

		return menuList;
	}
	
	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {

		MenuVO menu = menuDAO.selectMenuByMcode(mCode);

		return menu;
	}

}
