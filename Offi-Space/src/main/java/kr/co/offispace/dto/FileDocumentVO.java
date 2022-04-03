package kr.co.offispace.dto;

public class FileDocumentVO {
	
	private String id;
	private String parent;
	private String text;
	private String icon;
	
	private String fileDate;
	private double fileSize;
//	private boolean opened;
	
	private String realName;
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
	

	public FileDocumentVO()	{}
	
	public FileDocumentVO(String id,String parent,String text,String icon, String fileDate, double fileSize, String realName)
	{
		this.id=id;
		this.parent=parent;
		this.text=text;
		this.icon=icon;
		
		this.fileDate=fileDate;
		this.fileSize=fileSize;
		this.realName=realName;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	
	public String getFileDate() {
		return fileDate;
	}

	public void setFileDate(String fileDate) {
		this.fileDate = fileDate;
	}

	public double getFileSize() {
		return fileSize;
	}
	
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}
	
//	public boolean isOpened() {
//		return opened;
//	}
//
//	public void setOpened(boolean opened) {
//		this.opened = opened;
//	}

	
}
