package com.smfy.util;
/**
* 
* 字符流封装方法
*
*/
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

public class FileBuffer {
	//<!-----------------------bufferedRead 读取文本文件，一行一行的读取，更快！----------------------->
		public static String brFile(String path){
			StringBuffer sb=new StringBuffer();
			        //先创建一个reader对象
			Reader reder=null;
			BufferedReader br=null;
			try {
				reder=new FileReader(path);
				br=new BufferedReader(reder);
				//开始读取
				String line="";
				while ((line=br.readLine())!=null) {
					sb.append(line);			
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				try {
					//先开后关
					if (br!=null) {
						br.close();
					}
					if (reder!=null) {
						reder.close();
					}
					
				} catch (IOException e) {			
					e.printStackTrace();
				}
			}
			return  sb.toString();
		}
		//<!-----------------------bufferedRead 写入文本文件，一行一行的写入，更快！----------------------->
		public static boolean bwFile(String path,String content,boolean flag){
			boolean result=false;
			    //先创建一个writer对象
			Writer writer=null;
			BufferedWriter bw=null;
			try {
				writer=new FileWriter(path,flag);//flag表示是否覆盖,flag=true表示在末尾添加，flag=false表示覆盖
				bw=new BufferedWriter(writer);
				//开始写入
				bw.write(content);
				//写入大量数据，要刷新缓存区
				bw.flush();
				result=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				try {
					//先开后关
					if (bw!=null) {
						bw.close();
					}
					if (writer!=null) {
						writer.close();
					}
					
				} catch (IOException e) {			
					e.printStackTrace();
				}
			}
			return result;
		}
		//<!------------------------------------buffered进行文本文件的复制！------------------------------------>
		public static boolean bcFile(String frompath,String toPath){
			boolean result=false;
			// 文件的复制:先读取要复制的文件，再写入新文件
			//1.读取文件
			Reader reder=null;
			BufferedReader br=null;
			//2.写入文件
			Writer writer=null;
			BufferedWriter bw=null;			
			try {
				//3.读取
				reder=new FileReader(frompath);
				br=new BufferedReader(reder);
				//4.写入
				writer=new FileWriter(toPath);
				bw=new BufferedWriter(writer);
				//5.边读边写
				//【读】
				StringBuffer content=new StringBuffer();
				String line="";
				while ((line=br.readLine())!=null) {
					content.append(line);
				}
				//【写】
				bw.write(content.toString());
				//写入大量数据，要刷新缓存区
				bw.flush();
				result=true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		finally{
			
				try {
					//先开后关
					if (br!=null) {
						br.close();
					}
					if (reder!=null) {
						reder.close();
					}
					
					if (bw!=null) {
						bw.close();
					}
					if (writer!=null) {
						writer.close();
					}
					
				} catch (IOException e) {			
					e.printStackTrace();
				}
			}
			return result;
		}
	}