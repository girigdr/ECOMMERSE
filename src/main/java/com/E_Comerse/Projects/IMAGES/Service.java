//
//package com.E_Comerse.Projects.IMAGES;
//
//import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
//import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
//import com.google.api.client.http.FileContent;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.gson.GsonFactory;
//import com.google.api.services.drive.Drive;
//import com.google.api.services.drive.DriveScopes;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.security.GeneralSecurityException;
//import java.util.Collections;
//
//@org.springframework.stereotype.Service
//public class Service {
//
//    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
//    private static final String SERVICE_ACCOUNT_KEY_PATH = "D:\\Projects\\service-account.json";
//
//    private static String getPathToGoodleCredentials() {
//        String currentDirectory = System.getProperty("user.dir");
//        Path filePath = Paths.get(currentDirectory, "service-account.json");
//        return filePath.toString();
//    }
//
//    public Res uploadImageToDrive(File file) throws GeneralSecurityException, IOException {
//        Res res = new Res();
//
//
//
//        try{
//            String folderId = "1-ddR1gmohY1yk9b9Y06S5fAnDktJ5VA8";
//            Drive drive = createDriveService();
//            com.google.api.services.drive.model.File fileMetaData = new com.google.api.services.drive.model.File();
//            fileMetaData.setName(file.getName());
//            fileMetaData.setParents(Collections.singletonList(folderId));
//            FileContent mediaContent = new FileContent("image/jpeg", file);
//            com.google.api.services.drive.model.File uploadedFile = drive.files().create(fileMetaData, mediaContent)
//                    .setFields("id").execute();
//            String imageUrl = "https://drive.google.com/uc?export=view&id="+uploadedFile.getId();
//            System.out.println( uploadedFile.getId() ) ;
//            System.out.println("Uploading to folder: " + folderId);
//            System.out.println("IMAGE URL: " + imageUrl);
//            file.delete(); //https://drive.google.com/uc?export=view&id=18Vwc7ywsyfhIo5dylMQivtdXpSurO43Y
//            res.setStatus(200);
//            res.setMessage("Image Successfully Uploaded To Drive");
//            res.setUrl(imageUrl);
//        }catch (Exception e){
//            System.out.println(e.getMessage());
//            res.setStatus(500);
//            res.setMessage(e.getMessage());
//        }
//        return  res;
//
//    }
//
//    private Drive createDriveService() throws GeneralSecurityException, IOException {
//
//        GoogleCredential credential = GoogleCredential.fromStream(new FileInputStream(SERVICE_ACCOUNT_KEY_PATH))
//                .createScoped(Collections.singleton(DriveScopes.DRIVE));
//
//        return new Drive.Builder(
//                GoogleNetHttpTransport.newTrustedTransport(),
//                JSON_FACTORY,
//                credential)
//                .build();
//
//    }
//}