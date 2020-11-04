package com.smfy.util;
/**
 * 字节流封装方法
 */
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileStream {
	//<!----------------------------------------------------读取文件---------------------------------------------------->
	public static String readFile(String path){
		StringBuffer sb=new StringBuffer();
		//1.创建文件的字节流
		InputStream fis=null;
		try {
			fis=new FileInputStream(path);//InputStream为抽象类，不能实例化
			byte [] bytes=new byte[1024];//数组
			int data=0;			
				while ((data=fis.read(bytes))!=-1) {//(data=fis.read(bytes))!=-1表示读到最后了
					//字符串的转换
					String str=new String(bytes,0,data);//后面加,0,data是防止1024出现0000000
					sb.append(str);
				}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
	        //2.关闭字节流
			try {
				if (fis!=null) {
					fis.close();				
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return  sb.toString();
	}
	//<!----------------------------------------------------写入文件---------------------------------------------------->
	public static boolean writeFile(String path,String content,boolean flag){
		boolean result=false;
		//1.创建文件的字节流
        OutputStream fos=null;
        try {
                //2.创建 输出流对象
			fos=new FileOutputStream(path, flag);//flag表示是否覆盖,flag=true表示在末尾添加，flag=false表示覆盖
			//字符串String--->byte[]
			byte[] words=content.getBytes();
			//写入
			fos.write(words, 0, words.length);
			result=true;
		} catch (Exception e) {
			
		}
		finally{
			try {
				if (fos!=null) {
					fos.close();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	//<!----------------------------------------------------文件的复制---------------------------------------------------->
	public static boolean copyFile(String frompath,String toPath){
		boolean result=false;
		// 文件的复制:先读取要复制的文件，再写入新文件
		//1.读取文件
		InputStream fis=null;
		//2.写入文件
		OutputStream fos=null;
		try {
			//3.读取
			fis=new FileInputStream(frompath);
			//4.写入
			fos=new FileOutputStream(toPath);
			//5.边读边写
			StringBuffer content=new StringBuffer();
			//【读】
			byte [] bytes=new byte[1024];//数组
			int data=0;			
				while ((data=fis.read(bytes))!=-1) {//(data=fis.read(bytes))!=-1表示读到最后了
					//字符串的转换
					String str=new String(bytes,0,data);//后面加,0,data是防止1024出现0000000
					content.append(str);
				}
		       //【写】
				//字符串String--->byte[]
				byte[] words=content.toString().getBytes();
				//写入
				fos.write(words, 0, words.length);
			result=true;	
		} catch (Exception e) {
			
		}
		
		finally{
			
			try {
				if (fis!=null) {
					fis.close();
				}
				if (fos!=null) {
					fos.close();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
