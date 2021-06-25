package com.group.jsp;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class UploadFile {
    public int id;
    public String url;
    public String name;

    public UploadFile(int id, String url, String name) {
        this.id = id;
        this.url = url;
        this.name = name;
    }

    public static UploadFile makeNewUploadFile(InputStream stream, String path, String fileName) throws IOException {
        int id = Utils.makeId();
        File targetFile = new File(path + "/" + fileName);
        FileUtils.copyInputStreamToFile(stream, targetFile);
        return new UploadFile(id, "./files/" + fileName, fileName);
    }
}
