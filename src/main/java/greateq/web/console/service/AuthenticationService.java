package greateq.web.console.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import greateq.web.console.dao.AdminRoleDAO;
import greateq.web.console.dao.AdminSystemCategoryDAO;
import greateq.web.console.dao.AdminSystemDAO;
import greateq.web.console.dao.AdminUserDAO;
import greateq.web.console.domain.AdminLogin;
import greateq.web.console.domain.AdminRole;
import greateq.web.console.domain.AdminSystem;
import greateq.web.console.domain.AdminSystemCategory;
import greateq.web.console.domain.AdminUser;
import greateq.web.console.util.GenAPI;
import greateq.web.console.vo.MenuBar;
import greateq.web.console.vo.MenuItem;

public class AuthenticationService {
	private AdminUserDAO adminUserDao;
	private AdminRoleDAO adminRoleDao;
	private AdminSystemDAO adminSystemDao;
	private AdminSystemCategoryDAO adminSystemCategoryDao;

	protected Connection cn;
	
	public AuthenticationService(Connection cn){
		this.cn=cn;
		adminUserDao = new AdminUserDAO(cn);
		adminRoleDao = new AdminRoleDAO(cn);
		adminSystemDao = new AdminSystemDAO(cn);
		adminSystemCategoryDao = new AdminSystemCategoryDAO(cn);
	}
	public Connection getCn() {
		return cn;
	}

	public void setCn(Connection cn) {
		this.cn = cn;
	}

	public AdminLogin signIn(String username,String password) throws ServiceException{
		AdminLogin login = new AdminLogin();
		try{
			AdminUser user = adminUserDao.selectByName(username);
			if (user==null) {
				throw ServiceException.throwException(ServiceException.ERROR_CODE_USER_NOT_FOUND);
			}
			if (user.getLocked()){
				throw ServiceException.throwException(ServiceException.ERROR_CODE_USER_LOCKED);
			}
			
			if (!GenAPI.hashPassword(password).equals(user.getPassword())){
				if (user.getTriedTimes()+1>6){
					user.setLocked(true);
				}else{
					user.setTriedTimes(user.getTriedTimes()+1);
				}
				
				adminUserDao.update(user);
				
				throw ServiceException.throwException(ServiceException.ERROR_CODE_PASSWORD_WRONG);
			}
			
			user.setTriedTimes(0);
			user.setLoginTime(new Date());
			adminUserDao.update(user);
			
			login.setUser(user);
			
			List<AdminRole> roles = adminRoleDao.getGrantedRolesByUserId(user.getId());
			login.setRoles(roles);
			
			List<Long> systemIds=null;
			if (user.getIsAdmin()){
				systemIds= adminSystemDao.getSystemIds();
			}else{
				systemIds= adminSystemDao.getGrantedSystemIds(user.getId());
			}
			login.setSystemIds(systemIds);
		}catch(SQLException ex){
			ex.printStackTrace();
			throw ServiceException.throwException(ServiceException.ERROR_CODE_UNKNOWN,ex);
		}

		return login;
	}
	
	public List<MenuBar> retrieveMenu(List<Long> systemIds) throws SQLException{
		List<AdminSystem> grantedSystems = this.adminSystemDao.selectByIds(systemIds);
		List<AdminSystemCategory> allCategories = adminSystemCategoryDao.selectAll(true);
		
		Map<Long,MenuBar> menuBarMap = new HashMap<Long,MenuBar>();
		MenuBar uncategorizedBar = new MenuBar();
		uncategorizedBar.setId(999999999l);//uncategorized
		uncategorizedBar.setName("Uncategorized");
		uncategorizedBar.setDescription("Uncategorized");
		uncategorizedBar.setSortOrder(999999999);
		menuBarMap.put(uncategorizedBar.getId(), uncategorizedBar);

		for (AdminSystemCategory category:allCategories){
			MenuBar bar = new MenuBar();
			bar.setId(category.getId());
			bar.setName(category.getName());
			bar.setDescription(category.getDescription());
			bar.setSortOrder(category.getSortOrder());
			menuBarMap.put(bar.getId(), bar);
		}
		
		for (AdminSystem system:grantedSystems){
			MenuItem item = new MenuItem();
			item.setId(system.getId());
			item.setName(system.getName());
			item.setDescription(system.getDescription());
			item.setSortOrder(system.getSortOrder());
			item.setUrl(system.getUrl());
			
			MenuBar theBar= menuBarMap.get(system.getCategoryId());
			if (theBar==null){
				uncategorizedBar.addItem(item);
			}else{
				theBar.addItem(item);
			}
			
		}
		
		
		List<MenuBar> menuBarList = new ArrayList<MenuBar>();
		for(MenuBar menuBar: menuBarMap.values()){
			if (!menuBar.isEmpty()){
				menuBarList.add(menuBar);
			}
		}
		
		Comparator<MenuBar> comp = new Comparator<MenuBar>(){
			public int compare(MenuBar a, MenuBar b) {
				return a.getSortOrder().compareTo(b.getSortOrder());
			}
		};

		Collections.sort(menuBarList, comp);
		return menuBarList;
	}

}
