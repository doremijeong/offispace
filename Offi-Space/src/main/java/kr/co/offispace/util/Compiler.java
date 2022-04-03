package kr.co.offispace.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Compiler {
	public static void main(String[] args) throws IOException {
//		File file = new File("C:\\Users\\InSung\\Desktop\\대덕\\workspace.WebRTC\\myRTC");
//		Runtime.getRuntime().exec("cmd /c npm run dev",null,file);
//		Runtime.getRuntime().exec("cmd /c npm run dev",null,file);
		
		
		String rootPath = System.getProperty("user.dir");;
        System.out.println("현재 프로젝트의 경로 : "+rootPath );
        
        Path relativePath = Paths.get("");
        String path = relativePath.toAbsolutePath().toString();
        System.out.println("Working Directory = " + path);
        
        File path2 = new File(".");
        System.out.println(path2.getAbsolutePath()); //--> 프로젝트 폴더의 주소가 출력됨

        String path3 = Compiler.class.getResource("").getPath(); // 현재 클래스의 절대 경로를 가져온다.
        System.out.println(path3); //--> 절대 경로가 출력됨
        File fileInSamePackage = new File(path + "test.txt"); // path 폴더 내의 test.txt 를 가리킨다.
        System.out.println(fileInSamePackage);
        
//		a.addShutdownHook(new Thread());
//		a.addShutdownHook(new Thread());
//		String[] array= {"cmd /c cd Desktop\\대덕\\workspace.WebRTC\\myRTC","cmd /c npm run dev"};
//		Runtime.getRuntime().exec(array);
//		Process process = Runtime.getRuntime().exec("cmd /c cd Desktop\\대덕\\workspace.WebRTC\\myRTC");
//		Runtime.getRuntime().exec("cmd /c npm run dev");
		
//		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream(),"euc-kr"));
//		
//		String line=null;
//		StringBuffer readBuffer = new StringBuffer();
//		
//		while((line=bufferedReader.readLine())!=null)
//		{
//			readBuffer.append(line);
//			readBuffer.append("\n");
//		}
//		
//		System.out.println(readBuffer.toString());
	}
}
