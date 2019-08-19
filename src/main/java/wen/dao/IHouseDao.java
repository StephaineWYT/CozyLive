package wen.dao;

import wen.pojo.HouseView;

import java.util.List;

public interface IHouseDao {
    List<HouseView> findFourHouseByType(int housetype);

    List<HouseView> searchHouseViewByType(int houseType);

    List<HouseView> searchThreeRandomView();

    List<HouseView> searchHouseByType(int houseType);
}
