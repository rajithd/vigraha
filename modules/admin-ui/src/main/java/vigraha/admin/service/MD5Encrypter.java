package vigraha.admin.service;


import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encrypter {

    public static String encryptPassword(String password){
        String toEnc = password;
        MessageDigest mdEnc = null;

        try {

            mdEnc = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        mdEnc.update(toEnc.getBytes(),0,toEnc.length());
        String md5 = new BigInteger(1,mdEnc.digest()).toString(16);
        return md5;

    }
}
