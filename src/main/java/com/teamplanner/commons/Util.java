package com.teamplanner.commons;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class Util {
	public static byte[] getHashedData(String source, String algorithm) {

		byte[] hashedData = null;

		try {

			MessageDigest md = MessageDigest.getInstance(algorithm);

			hashedData = md.digest(source.getBytes());
		} catch (NoSuchAlgorithmException ex) {
			hashedData = null;
		}

		return hashedData;
	}

	public static String getHashedString(String source, String algorithm) {

		byte[] hashedData = getHashedData(source, algorithm);

		if (hashedData == null)
			return null;

		String hashedString = "";
		for (int i = 0; i < hashedData.length; i++) {
			String hexString = Integer
					.toHexString((int) hashedData[i] & 0x000000ff);
			if (hexString.length() < 2)
				hexString = "0" + hexString;

			hashedString += hexString;
		}

		return hashedString;
	}

	// ////////////////////////////////////////////////////////////////

	public static String getUniqueFileName(String path, String fileName) {
		String name = fileName.substring(0, fileName.lastIndexOf("."));
		String ext = fileName.substring(fileName.lastIndexOf("."));
		int index = 1;
		while (true) {
			File file = new File(path + "\\" + name + "_" + index + ext);
			if (file.exists())
				index++;
			else
				break;
		}

		return name + "_" + index + ext;
	}

	public static String getUniqueFileName(String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));

		String name = UUID.randomUUID().toString();

		return name + ext;
	}
}
