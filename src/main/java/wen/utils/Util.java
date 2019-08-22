package wen.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Util {
    public static String getPicName() {
        // 根据时间生成随机数
        String picName = new SimpleDateFormat("yyyyMMdd").format(new Date()) + UUID.randomUUID().toString();
        return picName;
    }

    public static void main(String[] args) {
        System.out.println(Util.getPicName());
    }
}
