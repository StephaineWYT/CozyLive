package wen.service;

import wen.pojo.House;
import wen.pojo.HouseView;
import wen.pojo.PageInfo;

import java.util.List;

public interface IHouseService {
    List<HouseView> findFourHouseByType(int houseType);

    List<HouseView> searchThreeRandomView(int houseType);

    PageInfo<HouseView> searchHouseViewByType(int currentPage, int houseType);

    HouseView searchDetailByHouseId(int houseId);

    void postHouse(House house);
}
