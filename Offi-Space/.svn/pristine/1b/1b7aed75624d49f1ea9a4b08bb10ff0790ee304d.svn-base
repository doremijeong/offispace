package kr.co.offispace.service.ip;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dao.ip.IPDAO;
import kr.co.offispace.dto.IPVO;

public class IPServiceImpl implements IPService{

	private IPDAO IPDAO;
	public void setIPDAO(IPDAO iPDAO) {
		IPDAO = iPDAO;
	}
	
	@Override
	public boolean IPCheck(IPVO IP) throws SQLException {
		
		boolean flag=false;
		
		IPVO DBIP = IPDAO.selectIPAddrByEmpCode(IP);
		
		if(DBIP!=null) //IP 값이 있으면 그게 그냥 통과임 
		{
			flag=true;
		}
		
		return flag;
	}

}
