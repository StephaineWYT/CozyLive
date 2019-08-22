package wen.controller;


import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import wen.pojo.House;
import wen.pojo.HouseView;
import wen.pojo.PageInfo;
import wen.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import wen.utils.Util;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("house")
public class HouseController {

    @Autowired
    IHouseService houseService;

    @RequestMapping("findFourHouseByType.do")
    public ModelAndView findFourHouseByType() {
        List<HouseView> newhouse = houseService.findFourHouseByType(0);
        List<HouseView> oldhouse = houseService.findFourHouseByType(1);
        List<HouseView> renthouse = houseService.findFourHouseByType(2);

        ModelAndView mv = new ModelAndView();
        mv.addObject("newHouse", newhouse);
        mv.addObject("oldHouse", oldhouse);
        mv.addObject("rentHouse", renthouse);
        mv.setViewName("../home");

        return mv;
    }

    @RequestMapping("searchHouseViewByType.do")
    public ModelAndView searchHouseViewByType(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, int houseType) {
        PageInfo<HouseView> pageInfo = houseService.searchHouseViewByType(currentPage, houseType);

        for (HouseView houseView : pageInfo.getLists()) {
            long createTime = houseView.getCreateTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date(createTime));
            houseView.setDate(date);
        }

        List<HouseView> randomHouses = houseService.searchThreeRandomView(houseType);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.addObject("randomHouses", randomHouses);

        if (houseType == 0) {
            mv.setViewName("newhouse");
        } else if (houseType == 1) {
            mv.setViewName("oldhouse");
        } else if (houseType == 2) {
            mv.setViewName("renthouse");
        }

        return mv;
    }

    @RequestMapping("searchDetail.do")
    public ModelAndView searchDetailByHouseId(int houseId) {
        HouseView houseView = houseService.searchDetailByHouseId(houseId);
        ModelAndView mv = new ModelAndView();
        mv.addObject("houseView", houseView);
        mv.setViewName("details");
        return mv;
    }

    @RequestMapping("releaseHouse.do")
    public String releaseHouse() {
        return "housePost1";
    }

    @RequestMapping("toHousePost2.do")
    public String toHousePost2(HttpSession session,
                               @Param(value = "houseTitle") String houseTitle,
                               @Param(value = "houseAddress") String houseAddress,
                               @Param(value = "housePrice") BigDecimal housePrice,
                               @Param(value = "priceUnit") String priceUnit,
                               @Param(value = "houseHeadimg") MultipartFile houseHeadimg,
                               @Param(value = "housePlanimg1") MultipartFile housePlanimg1,
                               @Param(value = "housePlanimg2") MultipartFile housePlanimg2,
                               @Param(value = "houseImg1") MultipartFile houseImg1,
                               @Param(value = "houseImg2") MultipartFile houseImg2,
                               @Param(value = "houseImg3") MultipartFile houseImg3,
                               @Param(value = "houseImg4") MultipartFile houseImg4,
                               @Param(value = "houseImg5") MultipartFile houseImg5,
                               @Param(value = "houseImg6") MultipartFile houseImg6) throws IOException {
        House house = new House();
        house.setHouseTitle(houseTitle);
        house.setHouseAddress(houseAddress);
        house.setHousePrice(housePrice);
        house.setPriceUnit(priceUnit);
        //暂时存放userID
        house.setUserId(10001);

        // 存放图片,如果为空则不上传
        Map<String, byte[]> images = new HashMap<>();
        if (houseHeadimg.getSize() != 0) {

            if (housePlanimg1.getSize() != 0) {
                byte[] planimg1Byte = housePlanimg1.getBytes();
                String planimg1 = Util.getPicName();
                house.setHousePlanimg1(planimg1);
                images.put(planimg1, planimg1Byte);
            }

            if (housePlanimg2.getSize() != 0) {
                byte[] planimg2Bytes = housePlanimg2.getBytes();
                String planimg2 = Util.getPicName();
                house.setHousePlanimg2(planimg2);
                images.put(planimg2, planimg2Bytes);
            }

            if (houseImg1.getSize() != 0) {
                byte[] img1Bytes = houseImg1.getBytes();
                String img1 = Util.getPicName();
                house.setHouseImg1(img1);
                images.put(img1, img1Bytes);
            }

            if (houseImg2.getSize() != 0) {
                byte[] img2Bytes = houseImg2.getBytes();
                String img2 = Util.getPicName();
                house.setHouseImg2(img2);
                images.put(img2, img2Bytes);
            }

            if (houseImg3.getSize() != 0) {
                byte[] img3Bytes = houseImg3.getBytes();
                String img3 = Util.getPicName();
                house.setHouseImg3(img3);
                images.put(img3, img3Bytes);
            }

            if (houseImg4.getSize() != 0) {
                byte[] img4Bytes = houseImg4.getBytes();
                String img4 = Util.getPicName();
                house.setHouseImg4(img4);
                images.put(img4, img4Bytes);
            }

            if (houseImg5.getSize() != 0) {
                byte[] img5Bytes = houseImg5.getBytes();
                String img5 = Util.getPicName();
                house.setHouseImg5(img5);
                images.put(img5, img5Bytes);
            }

            if (houseImg6.getSize() != 0) {
                byte[] img6Bytes = houseImg6.getBytes();
                String img6 = Util.getPicName();
                house.setHouseImg6(img6);
                images.put(img6, img6Bytes);
            }

        }

        houseService.postHouse(house);
        return "housePost2";
    }
}
