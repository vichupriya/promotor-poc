package com.promo.service.impl;


import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;
import com.google.appengine.tools.cloudstorage.RetryParams;
import org.joda.time.format.DateTimeFormatter;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@MultipartConfig(
        maxFileSize = 10 * 1024 * 1024, // max size for uploaded files
        maxRequestSize = 20 * 1024 * 1024, // max size for multipart/form-data
        fileSizeThreshold = 5 * 1024 * 1024 // start writing to Cloud Storage after 5MB
)
public class GcsHelper {
    private static final int BUFFER_SIZE = 2 * 1024 * 1024;
    private final String bucket = "promoappimages";
    private  GcsService gcsService=null;
    public GcsHelper() {
         gcsService =
                GcsServiceFactory.createGcsService(
                        new RetryParams.Builder()
                                .initialRetryDelayMillis(10)
                                .retryMaxAttempts(10)
                                .totalRetryPeriodMillis(15000)
                                .build());

    }
    private String uploadedFilename(String businessName,final Part part) {

        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                // Append a date and time to the filename

                //DateTime dt = DateTime.now(DateTimeZone.UTC);
              //  String dtString = dt.toString(dtf);
                final String fileName =
                        businessName + content.substring(content.indexOf('=') + 1).trim().replace("\"", "");

                return fileName;
            }
        }
        return null;
    }
    private void copy(InputStream input, OutputStream output) throws IOException {

        try {
            byte[] buffer = new byte[BUFFER_SIZE];
            int bytesRead = input.read(buffer);
            while (bytesRead != -1) {
                output.write(buffer, 0, bytesRead);
                bytesRead = input.read(buffer);
            }
        } finally {
            input.close();
            output.close();
        }

    }
}
