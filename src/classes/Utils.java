package com.group.jsp;

import org.apache.commons.io.IOUtils;

import javax.servlet.http.Part;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class Utils {
    public static String encode(final String clearText) {
        try {
            return new String(
                    Base64.getEncoder().encode(MessageDigest.getInstance("SHA-256").digest(clearText.getBytes(StandardCharsets.UTF_8))));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String partToString(Part p) throws IOException {
        StringWriter writer = new StringWriter();
        IOUtils.copy(p.getInputStream(), writer, StandardCharsets.UTF_8);
        String theString = writer.toString();
        return theString;
    }

    public static int makeId() {
        return new SecureRandom().nextInt();
    }
}
