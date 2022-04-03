package kr.co.offispace.util;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.co.offispace.dto.AttachmentVO;

public class MakeFileName {
	
	//만들기
	public static String toUUIDFileName(String fileName, String delimiter)
	{
		String uuid=UUID.randomUUID().toString().replace("-", "");
		return uuid+delimiter+fileName;
	}
	
	//파일이름만 뽑아내기
	public static String parseFileNameFromUUID(String fileName,String delimiter)
	{
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length-1]; //배열[배열의크기-1];
	}
	
	
	public static List<AttachmentVO> parseFileNameFromAttaches(List<AttachmentVO> attachList,String delimiter)
	{
		List<AttachmentVO> renamedAttachList=new ArrayList<AttachmentVO>();
		
		for(AttachmentVO attachment:attachList)
		{
			String fileName=attachment.getAttachSavename(); // DB 상의 fileName
			fileName=parseFileNameFromUUID(fileName, delimiter); //uuid가 제거된.
			//fileName
			attachment.setAttachSavename(fileName);
			
			renamedAttachList.add(attachment);
		}
		
		return renamedAttachList; //다운로드 할때는 이젠 ano를 보낸다. db한번 전달해서 attachvo를 다시한번 받아야한다. 그래야 거기 파일명과 uploadpath가 있다.
	}
}
