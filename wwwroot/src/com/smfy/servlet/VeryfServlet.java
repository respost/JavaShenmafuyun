package com.smfy.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VeryfServlet
 */
public class VeryfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VeryfServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  //1、【生成验证码】第一步：
    Color getRandColor(int fc, int bc) {//给定范围获得随机颜色  
    Random random = new Random();
    if (fc > 255)
    fc = 255;
    if (bc > 255)
    bc = 255;
    int r = fc + random.nextInt(bc - fc);
    int g = fc + random.nextInt(bc - fc);
    int b = fc + random.nextInt(bc - fc);
    return new Color(r, g, b);
    }
    //2、【生成验证码】第二步：
       /**
        * 生成数字验证码
        * @param request
        * @param response
        * @throws ServletException
        * @throws IOException
        */
       void GenerateNumberVerify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //设置页面不缓存  
       response.setHeader("Pragma", "No-cache");
       response.setHeader("Cache-Control", "no-cache");
       response.setDateHeader("Expires", 0);
       
       //声明session和out
       HttpSession session =  request.getSession();
       ServletOutputStream out = response.getOutputStream(); 
       
       // 在内存中创建图象  
       int width = 63, height = 33;
       BufferedImage image = new BufferedImage(width, height,
       BufferedImage.TYPE_INT_RGB);
       // 获取图形上下文  
       Graphics g = image.getGraphics();
       //生成随机类  
       Random random = new Random();
       // 设定背景色  
       g.setColor(getRandColor(200, 250));
       g.fillRect(0, 0, width, height);
       //设定字体  
       g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
       //画边框  
       //g.setColor(new Color());  
       //g.drawRect(0,0,width-1,height-1);  
       // 随机产生155条干扰线，使图象中的验证码不易被其它程序探测到  
       g.setColor(getRandColor(160, 200));
       for (int i = 0; i < 155; i++) {
       int x = random.nextInt(width);
       int y = random.nextInt(height);
       int xl = random.nextInt(12);
       int yl = random.nextInt(12);
       g.drawLine(x, y, x + xl, y + yl);
       }
       // 取随机产生的验证码(4位数字)  
       String sRand = "";
       for (int i = 0; i < 4; i++) {
       String rand = String.valueOf(random.nextInt(10));
       sRand += rand;
       // 将验证码显示到图象中  
       g.setColor(new Color(20 + random.nextInt(110), 20 + random
       .nextInt(110), 20 + random.nextInt(110)));//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成  
       g.drawString(rand, 13 * i + 8, 20);//13为字体间距,8为left参数，20为top参数  
       }
       
       
       // 将验证码存入SESSION  
       session.setAttribute("code", sRand);
       // 图象生效  
       g.dispose();  
       // 输出图象到页面  
       ImageIO.write(image, "JPEG", response.getOutputStream());  
       out.flush();  
       out.close();
       }
       /**
        * 生成混合验证码（英文，中文，数字）
        * @param request
        * @param response
        * @throws ServletException
        * @throws IOException
        */
       void GenerateWordVerify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //设置页面不缓存
       response.setHeader("Pragma", "No-cache");
       response.setHeader("Cache-Control", "no-cache");
       response.setDateHeader("Expires", 0);    
    //声明session和out
    HttpSession session =  request.getSession();
    ServletOutputStream out = response.getOutputStream(); 
       
       // 设置图片的长宽
       int width = 63, height = 33;
       //设置备选内容
       //英文+数字 
       String base = "u7684u4e00u4e86u662fu6211u4e0du5728u4ebau4eecu6709u6765u4ed6u8fd9u4e0au7740u4e2au5730u5230u5927u91ccu8bf4u5c31u53bbu5b50u5f97u4e5fu548cu90a3u8981u4e0bu770bu5929u65f6u8fc7u51fau5c0fu4e48u8d77u4f60u90fdu628au597du8fd8u591au6ca1u4e3au53c8u53efu5bb6u5b66u53eau4ee5u4e3bu4f1au6837u5e74u60f3u751fu540cu8001u4e2du5341u4eceu81eau9762u524du5934u9053u5b83u540eu7136u8d70u5f88u50cfu89c1u4e24u7528u5979u56fdu52a8u8fdbu6210u56deu4ec0u8fb9u4f5cu5bf9u5f00u800cu5df1u4e9bu73b0u5c71u6c11u5019u7ecfu53d1u5de5u5411u4e8bu547du7ed9u957fu6c34u51e0u4e49u4e09u58f0u4e8eu9ad8u624bu77e5u7406u773cu5fd7u70b9u5fc3u6218u4e8cu95eeu4f46u8eabu65b9u5b9eu5403u505au53ebu5f53u4f4fu542cu9769u6253u5462u771fu5168u624du56dbu5df2u6240u654cu4e4bu6700u5149u4ea7u60c5u8defu5206u603bu6761u767du8bddu4e1cu5e2du6b21u4eb2u5982u88abu82b1u53e3u653eu513fu5e38u6c14u4e94u7b2cu4f7fu5199u519bu5427u6587u8fd0u518du679cu600eu5b9au8bb8u5febu660eu884cu56e0u522bu98deu5916u6811u7269u6d3bu90e8u95e8u65e0u5f80u8239u671bu65b0u5e26u961fu5148u529bu5b8cu5374u7ad9u4ee3u5458u673au66f4u4e5du60a8u6bcfu98ceu7ea7u8ddfu7b11u554au5b69u4e07u5c11u76f4u610fu591cu6bd4u9636u8fdeu8f66u91cdu4fbfu6597u9a6cu54eau5316u592au6307u53d8u793eu4f3cu58ebu8005u5e72u77f3u6ee1u65e5u51b3u767eu539fu62ffu7fa4u7a76u5404u516du672cu601du89e3u7acbu6cb3u6751u516bu96beu65e9u8bbau5417u6839u5171u8ba9u76f8u7814u4ecau5176u4e66u5750u63a5u5e94u5173u4fe1u89c9u6b65u53cdu5904u8bb0u5c06u5343u627eu4e89u9886u6216u5e08u7ed3u5757u8dd1u8c01u8349u8d8au5b57u52a0u811au7d27u7231u7b49u4e60u9635u6015u6708u9752u534au706bu6cd5u9898u5efau8d76u4f4du5531u6d77u4e03u5973u4efbu4ef6u611fu51c6u5f20u56e2u5c4bu79bbu8272u8138u7247u79d1u5012u775bu5229u4e16u521au4e14u7531u9001u5207u661fu5bfcu665au8868u591fu6574u8ba4u54cdu96eau6d41u672au573au8be5u5e76u5e95u6df1u523bu5e73u4f1fu5fd9u63d0u786eu8fd1u4eaeu8f7bu8bb2u519cu53e4u9ed1u544au754cu62c9u540du5440u571fu6e05u9633u7167u529eu53f2u6539u5386u8f6cu753bu9020u5634u6b64u6cbbu5317u5fc5u670du96e8u7a7fu5185u8bc6u9a8cu4f20u4e1au83dcu722cu7761u5174u5f62u91cfu54b1u89c2u82e6u4f53u4f17u901au51b2u5408u7834u53cbu5ea6u672fu996du516cu65c1u623fu6781u5357u67aau8bfbu6c99u5c81u7ebfu91ceu575au7a7au6536u7b97u81f3u653fu57ceu52b3u843du94b1u7279u56f4u5f1fu80dcu6559u70edu5c55u5305u6b4cu7c7bu6e10u5f3au6570u4e61u547cu6027u97f3u7b54u54e5u9645u65e7u795eu5ea7u7ae0u5e2eu5566u53d7u7cfbu4ee4u8df3u975eu4f55u725bu53d6u5165u5cb8u6562u6389u5ffdu79cdu88c5u9876u6025u6797u505cu606fu53e5u533au8863u822cu62a5u53f6u538bu6162u53d4u80ccu7ec6";
       //中文
       //String base ="你天爱风我没是在说美哈国日少飞牛四上三古下手右吃机浪水五花月二色好";
       //备选汉字的长度
       int length = base.length();
       //创建内存图像
       BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
       // 获取图形上下文
       Graphics g = image.getGraphics();
       //创建随机类的实例
       Random random = new Random();
       // 设定图像背景色(因为是做背景，所以偏淡)
       g.setColor(getRandColor( 200, 250));
       g.fillRect(0, 0, width, height);
       //备选字体
       String[] fontTypes = {
       "u5b8bu4f53", "u65b0u5b8bu4f53", "u9ed1u4f53", "u6977u4f53", "u96b6u4e66"};
       int fontTypesLength = fontTypes.length;
       //在图片背景上增加噪点
       g.setColor(getRandColor(160, 200));
       g.setFont(new Font("Times New Roman", Font.PLAIN, 14));
       for (int i = 0; i < 6; i++) {
       g.drawString("*********************************************", 0, 5 * (i + 2));
       }
    // 随机产生100条干扰线，使图象中的验证码不易被其它程序探测到  
    g.setColor(getRandColor(160, 200));
    for (int i = 0; i < 100; i++) {
    int x = random.nextInt(width);
    int y = random.nextInt(height);
    int xl = random.nextInt(12);
    int yl = random.nextInt(12);
    g.drawLine(x, y, x + xl, y + yl);
    }
       //取随机产生的认证码(4个汉字)
       //保存生成的汉字字符串
       String sRand = "";
       for (int i = 0; i < 4; i++) {
       int start = random.nextInt(length);
       String rand = base.substring(start, start + 1);
       sRand += rand;
       //设置字体的颜色
       g.setColor(getRandColor(10, 150));
       //设置字体
       g.setFont(new Font(fontTypes[random.nextInt(fontTypesLength)], Font.BOLD, 14 + random.nextInt(6)));//14为字体大小 
       //将此汉字画到图片上
       g.drawString(rand, 15 * i + 0 + random.nextInt(8), 20);//15为字体间距,8为left参数，20为top参数
       }
       //将认证码存入session
       session.setAttribute("code", sRand);
       g.dispose();
       //输出图象到页面
       ImageIO.write(image, "JPEG", response.getOutputStream());
    out.flush();  
    out.close();
       } 
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取数字验证码
		//GenerateNumberVerify(request, response);
		//获取混合验证码
		GenerateWordVerify(request, response);
	}

}
