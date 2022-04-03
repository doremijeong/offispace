package kr.co.offispace.dao.ip;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.dto.IPVO;

public interface IPDAO {

	public IPVO selectIPAddrByEmpCode(IPVO IP) throws SQLException;
}
