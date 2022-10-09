package com.minh.model;

import java.util.Base64;  
public class EncodeModel {
	public static String encode(String string) {
        Base64.Encoder encoder = Base64.getEncoder();  
        String encodeString = encoder.encodeToString(string.getBytes());  
		return encodeString;
	}
	public static String decode(String string) {
        Base64.Decoder decoder = Base64.getDecoder();
        String decodeString = new String(decoder.decode(string));  
		return decodeString;
	}
}
