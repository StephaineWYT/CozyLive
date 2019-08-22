package wen.utils;


import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.http.Response;

public class QiNiuYun {

    public static void main(String[] args) {
        Configuration cfg = new Configuration(Zone.zone2());
        UploadManager uploadManager = new UploadManager(cfg);

        String ak = "yBv9VPspsil9FkJnX39TAqwHXhoEAB8IPqxLcacn";
        String sk = "DwGV8Z6RFcgJ5GdWLS98k1z3u9rAKBIqoMN3ZbDS";

        String bucket = "stephanie";

        Auth auth = Auth.create(ak, sk);
        String uptake = auth.uploadToken(bucket);
        String filePath = "E:\\imagesFromCDisk\\Camera Roll\\02.jpg";
        String key = "haha.jpg";

        try {
            Response response = uploadManager.put(filePath, key, uptake);
            System.out.println(response);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
    }
}
