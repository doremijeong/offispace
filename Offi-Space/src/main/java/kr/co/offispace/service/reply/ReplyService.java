package kr.co.offispace.service.reply;

import java.sql.SQLException;
import java.util.List;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.dto.ReplyVO;

public interface ReplyService {
	// 댓글 등록
	public void registerReply(ReplyVO reply) throws SQLException;

	// 댓글 수정
	public void modifyReply(ReplyVO reply) throws SQLException;

	// 댓글 삭제
	public void removeReply(String replyCode) throws SQLException;

	// 댓글 조회
	public List<ReplyVO> getReplyList(Criteria cri, String boardCode) throws SQLException;
	public int getReplyListCount(String boardCode) throws SQLException;
}
