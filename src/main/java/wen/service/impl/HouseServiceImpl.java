package wen.service.impl;

import wen.dao.IHouseDao;
import wen.pojo.HouseView;
import wen.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public List<HouseView> searchHouseViewByType(int houseType) {
        return houseDao.searchHouseViewByType(houseType);
    }

    @Override
    public List<HouseView> searchThreeRandomView() {
        return houseDao.searchThreeRandomView();
    }

    @Override
    public List<HouseView> searchHouseByType(int houseType) {
        return houseDao.searchHouseByType(houseType);
    }
}
