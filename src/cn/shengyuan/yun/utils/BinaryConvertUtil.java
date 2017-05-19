package cn.shengyuan.yun.utils;

import java.util.Stack;

public class BinaryConvertUtil {
	public enum BinaryNumber {
		/** 二进制 */
		two(2),
		/** 八进制 */
		eight(8),
		/** 十六进制 */
		sixteen(16),
		/** 三十六进制 */
		thirtysix(36),
		/** 六十二进制 */
		sixtytwo(62);

		private int number;

		// 枚举类型构造函数只能为私有
		private BinaryNumber(int num) {
			this.number = num;
		}

		public int getNumber() {
			return number;
		}

	}

	private static char[] charSet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();

	/**
	 * 将十进制数字转换为指定进制的字符串
	 * 
	 * @param decimal
	 * @param scale
	 * @return
	 */
	public static String convertDecimalByNum(long decimal, BinaryNumber scale) {
		Long rest = decimal;
		int num = scale.getNumber();
		Stack<Character> stack = new Stack<Character>();
		StringBuilder result = new StringBuilder(0);
		while (rest != 0) {
			stack.add(charSet[new Long((rest - (rest / num) * num)).intValue()]);
			rest = rest / num;
		}
		for (; !stack.isEmpty();) {
			result.append(stack.pop());
		}

		return result.toString();
	}

}
