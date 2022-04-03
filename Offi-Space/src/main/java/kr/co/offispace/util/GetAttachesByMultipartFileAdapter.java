package kr.co.offispace.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.offispace.dto.AttachmentVO;

public class GetAttachesByMultipartFileAdapter {

	public static List<AttachmentVO> save(List<MultipartFile> multifiles, String savePath) throws Exception{
		List<AttachmentVO> attachList = new ArrayList<>();

		if(multifiles != null){
			for (MultipartFile multi : multifiles) {
				if(multi.getOriginalFilename() != null && multi.getOriginalFilename() != "") {

					String fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");

					File target = new File(savePath, fileName);

					target.mkdirs();

					multi.transferTo(target);

					AttachmentVO attach = new AttachmentVO();
					attach.setAttachSavepath(savePath);
					attach.setAttachSavename(fileName);
					attach.setAttachExtension(fileName.substring(fileName.lastIndexOf(".") + 1));
					attachList.add(attach);
				}
			}
		}

		return attachList;

	}
}
