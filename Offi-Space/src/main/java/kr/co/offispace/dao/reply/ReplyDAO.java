package kr.co.offispace.dao.reply;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.ReplyVO;

public interface ReplyDAO {
	// 댓글 등록
	public void insertReply(ReplyVO reply) throws SQLException;

	// 댓글 수정
	public void updateReply(ReplyVO reply) throws SQLException;

	// 댓글 삭제
	public void deleteReply(String replyCode) throws SQLException;

	// 댓글 조회
	public List<ReplyVO> selectReplyList(Criteria cri, String boardCode) throws SQLException;

	// 댓글 조회
	public int selectReplyListCount(String boardCode) throws SQLException;
}
