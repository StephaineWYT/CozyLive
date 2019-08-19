package wen.controller;


import wen.pojo.HouseView;
import wen.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
    public ModelAndView searchHouseViewByType(int houseType) {
        List<HouseView> houses = houseService.searchHouseByType(houseType);
        for (HouseView houseView : houses) {
            long createTime = houseView.getCreateTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String ct = sdf.format(new Date(createTime));
            houseView.setDate(ct);
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("houses", houses);
        if (houseType == 0) {
            mv.setViewName("newhouse");
        } else if (houseType == 1) {
            mv.setViewName("oldhouse");
        } else if (houseType == 2) {
            mv.setViewName("renthouse");
        }
        return mv;
    }

}
