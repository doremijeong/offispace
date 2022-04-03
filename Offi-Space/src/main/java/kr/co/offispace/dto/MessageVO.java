package kr.co.offispace.dto;

import java.util.Date;

public class MessageVO {
	
	private String msgCode;		    //쪽지 코드
	private String msgImpt;		    //쪽지 중요도
	private String msgContent;	    //쪽지 내용
	private Date msgDt;			    //쪽지 날짜
	private String msgDate;			//날짜 변환을 위한 string 형식
	private String msgRead;		    //읽음 여부
	private String msgClass;	    //개인,업무 분류
	private String msgPersonal;     //개인 보관함
	private String msgWork;		    //업무 보관함
	
	private String msgFrom;		    //보낸 사람 id
	private String msgFromCode;		    //보낸 사람 코드
	private String msgFromName;		//보낸 사람 이름
	private String msgFromTeam; 	//보낸 사람 팀
	private String msgFromPosition;	//보낸 사람 직급
	
	private String msgTo;		    //받는 사람 id
	private String msgToCode;		//받는 사람 코드		
	private String msgToName;		//받는 사람 이름
	private String msgToTeam; 		//받는 사람 팀
	private String msgToPosition;	//받는 사람 직급
	
	private int receivedMsgCnt;
	private int unreadMsgCnt;
	private int imptMsgCnt;
	
	
	public String getMsgCode() {
		return msgCode;
	}
	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}
	public String getMsgImpt() {
		return msgImpt;
	}
	public void setMsgImpt(String msgImpt) {
		this.msgImpt = msgImpt;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public Date getMsgDt() {
		return msgDt;
	}
	public void setMsgDt(Date msgDt) {
		this.msgDt = msgDt;
	}
	public String getMsgFrom() {
		return msgFrom;
	}
	public void setMsgFrom(String msgFrom) {
		this.msgFrom = msgFrom;
	}
	public String getMsgTo() {
		return msgTo;
	}
	public void setMsgTo(String msgTo) {
		this.msgTo = msgTo;
	}
	public String getMsgRead() {
		return msgRead;
	}
	public void setMsgRead(String msgRead) {
		this.msgRead = msgRead;
	}
	public String getMsgClass() {
		return msgClass;
	}
	public void setMsgClass(String msgClass) {
		this.msgClass = msgClass;
	}
	public String getMsgPersonal() {
		return msgPersonal;
	}
	public void setMsgPersonal(String msgPersonal) {
		this.msgPersonal = msgPersonal;
	}
	public String getMsgWork() {
		return msgWork;
	}
	public void setMsgWork(String msgWork) {
		this.msgWork = msgWork;
	}
	public String getMsgFromName() {
		return msgFromName;
	}
	public void setMsgFromName(String msgFromName) {
		this.msgFromName = msgFromName;
	}
	public String getMsgToName() {
		return msgToName;
	}
	public void setMsgToName(String msgToName) {
		this.msgToName = msgToName;
	}
	public String getMsgFromTeam() {
		return msgFromTeam;
	}
	public void setMsgFromTeam(String msgFromTeam) {
		this.msgFromTeam = msgFromTeam;
	}
	public String getMsgFromPosition() {
		return msgFromPosition;
	}
	public void setMsgFromPosition(String msgFromPosition) {
		this.msgFromPosition = msgFromPosition;
	}
	public String getMsgToTeam() {
		return msgToTeam;
	}
	public void setMsgToTeam(String msgToTeam) {
		this.msgToTeam = msgToTeam;
	}
	public String getMsgToPosition() {
		return msgToPosition;
	}
	public void setMsgToPosition(String msgToPosition) {
		this.msgToPosition = msgToPosition;
	}
	public String getMsgToCode() {
		return msgToCode;
	}
	public void setMsgToCode(String msgToCode) {
		this.msgToCode = msgToCode;
	}
	public String getMsgFromCode() {
		return msgFromCode;
	}
	public void setMsgFromCode(String msgFromCode) {
		this.msgFromCode = msgFromCode;
	}
	public String getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}
	public int getUnreadMsgCnt() {
		return unreadMsgCnt;
	}
	public void setUnreadMsgCnt(int unreadMsgCnt) {
		this.unreadMsgCnt = unreadMsgCnt;
	}
	public int getImptMsgCnt() {
		return imptMsgCnt;
	}
	public void setImptMsgCnt(int imptMsgCnt) {
		this.imptMsgCnt = imptMsgCnt;
	}
	public int getReceivedMsgCnt() {
		return receivedMsgCnt;
	}
	public void setReceivedMsgCnt(int receivedMsgCnt) {
		this.receivedMsgCnt = receivedMsgCnt;
	}
	

}
