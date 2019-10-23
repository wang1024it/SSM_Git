package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

	// ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091800543488";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCIawtYsyZUVip+7Zs6hLKXDD5L+iAoWnsWl0NiH0L3sCd08KoDRSamuMWzwu7bfONN1ldPfEimZqfD/HJZ8umIxa9kFNO6AlVjDyyCjng5bcDIPKyHew5CsIdKBgBJaCSMCJjWK7X0Ng0tPNSd3Z+Xc0SDvWdy7/PpM/NOO2SkVm06tQmXfgLR9innIzJ3u+cW2Ok2z8BOVI6tdTRxA0w4yPMGYllHp8W59/jjMpftS1MZKmk5nqjXJc1NgIoniGN26uG/1JmCbY/Ig0eY2X25CmSlK3K3rrRXl3pXHExkH4ZCV5B7jYVfYv6Y5T0wEFyeCNvx/Jm9GcYBlwXGAqbjAgMBAAECggEAZuWfHFudCLYpva3JjX00HBzfDH3xLZ76AxM7f1KnN57GVD2Hb4oEWnM6pJnfgu0Tos2O8+SCBAmgd4L+WfyQzFqYLfxLq51A/MQgRaXi5yZy6FZjqJlYK1Nt6JbYNoZ4Mqv1ZG56A2eVzs54bU8SprEKN/hwhFCcAQXves3v3sg7+E4JrOlaJamI+xZ+WrdmrsFdFqJGx/TpFcBrIqvu+Fb+A5tRd1Idn0nCzZAKP6aA27amS2iIRYrJKyhzBgPR7MGAyFHbQrio1oNYemjLBiy7Hw7nzmBeevLf+cZp72D+5JWkFZrn2qoD6WS2rptuBP5bBpaX/YmFP6Tu0BbvcQKBgQDAX9doaogWcXpZIEKe/hnpzxDg+ZT1gRt1OyqqcMA5WOEKEpaXS+aZiUS7Tq5GicH0WT9+SrOsk225M+SRQNH1/Ge3PLkKSRZEj4/YMExT2CVKBXzOOGTMNuuZdap1UdPoQwoUQNqC14BscHZMKmaaLiE3g6T9J7xO7bx0MMY/mwKBgQC1iXDJ1DJ2XS5n4Ocv4HPVoZnZXyimIpNCxO5BNqtau7TwaWnX2uR96JBN7Crp0jEV8i4DZGCkfr2fClbUhKzJASA/5WGMBUJKjF/DixObNGndQxoaEtW7rU2Vpq3+Fs0dcVc1G8rsQQ+7S66FNF1C5Kw/VQvOwRjH4rOYrX0+WQKBgDbS2XuraI8k1d5SgEn5Vn84gLHsztPMcHvPWdBrA40UVEXfmEUT32sAILNUr/vwRHMTgDHIrj3PYiS2sjvnAi8dOJ2S05Un0Q3G8BKHaSk33yCiQbgvgCJmwGviiaqXoFF/0X6GIP/K1JGS11PLfaQQ42yDuuBek57Wx69BOy5jAoGAIb/jkCI7H3ZDYlyVnnkED/tzNs5SKFDVP9yMzuLzCHNNOETgwJiZUi8iZNo7QC0rowDbPRY0QWCusBqj+e6QkO38qORkNjvkDyf5xcjdZEViSRhoieBmi/W0LtZGEq76gzbHF8CLAVE3M4Lmdy09CWqp+zw8bbvId6DV8tSOLEECgYBf6QVhK7+O+D5URp2USXGfcA+LfGWas6JLve6MzeGc5ijXAdBOY9xH1MbGNG/lmp24L5dNk2zpzEJNprdxGoooQWG5IJbFY6XeYqj4+fmIVA22dU2HuqIQwFOLkNK9cYFy33WwUXy5mme1diCb7dsf4JNk929iEL4naROyT+nwmg==";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
	// 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA72uhNCQ5LC1LAkIcdVMe5XR4Ulzfh22G39AmBcAHfgLx3li0gede/3NrObbPFv714o3qppKnm/j6jJJdhC/4WrcquEIdTnr3ukL6nnVzfquQwV3OzZgvuFov2UIyd1B9lLZIjOTCqOj5eIjs/D0+T4kgHAzDgDqc35d4qDA5XvKUIfxav8mhEkc6Vm5s6eyRmpLZMLkKEJbaoaKwd0vMG/cxcf3CuWCeOIGJ2sr/9JR07pp2YjrF0bo+shaS6j9gqzFGXt4Pa5hSeA9JW+Ol7EXj/pynfS0xCWyLqYYWy6bhyQwdxrpSOhULwL1ghgeTT/V+CmYuH1vm/XCVe/f86QIDAQAB";

	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1:8080/LogisticsSystemSSM/AlipayJsp/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1:8080/LogisticsSystemSSM/AlipayJsp/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "C:\\";

	// ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * 
	 * @param sWord
	 *            要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_"
					+ System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
