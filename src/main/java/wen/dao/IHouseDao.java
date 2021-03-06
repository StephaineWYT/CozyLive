package wen.dao;

import wen.pojo.House;
import wen.pojo.HouseView;

import java.util.HashMap;
import java.util.List;

public interface IHouseDao {
    List<HouseView> findFourHouseByType(int houseType);

    List<HouseView> searchThreeRandomView(int houseType);

    int selectCount(int houseType);

    List<HouseView> searchHouseViewByTypeAndPage(HashMap<String, Object> map);

    HouseView searchDetailByHouseId(int houseId);

    void postHouse(House house);
}
