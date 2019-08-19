package wen.service.impl;

import wen.dao.IHouseDao;
import wen.pojo.HouseView;
import wen.pojo.PageInfo;
import wen.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HouseServiceImpl implements IHouseService {
    @Autowired
    private IHouseDao houseDao;

    @Override
    public List<HouseView> findFourHouseByType(int houseType) {
        return houseDao.findFourHouseByType(houseType);
    }

    @Override
    public List<HouseView> searchThreeRandomView(int houseType) {
        return houseDao.searchThreeRandomView(houseType);
    }

    @Override
    public PageInfo<HouseView> searchHouseViewByType(int currentPage, int houseType) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("size", 5);

        PageInfo<HouseView> pageInfo = new PageInfo<>();
        pageInfo.setCurrentPage(currentPage);
        pageInfo.setPageSize(5);

        int count = houseDao.selectCount(houseType);
        Double d = Double.valueOf(count);
        Double num = Math.ceil(d / pageInfo.getPageSize());

        pageInfo.setTotalPage(num.intValue());
        pageInfo.setTotalCount(count);

        map.put("start", (currentPage - 1) * pageInfo.getPageSize());
        map.put("houseType", houseType);

        List<HouseView> houseViews = houseDao.searchHouseViewByTypeAndPage(map);
        pageInfo.setLists(houseViews);

        return pageInfo;
    }
}
