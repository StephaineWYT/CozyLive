package wen.controller;


import org.springframework.web.bind.annotation.RequestParam;
import wen.pojo.HouseView;
import wen.pojo.PageInfo;
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
        mv.addObject("houses", pageInfo.getLists());
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

}
