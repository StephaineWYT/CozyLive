package wen.service;

import wen.pojo.HouseView;

import javax.enterprise.inject.Model;
import java.util.List;

public interface IHouseService {
    List<HouseView> findFourHouseByType(int houseType);

    List<HouseView> searchHouseViewByType(int houseType);

    List<HouseView> searchThreeRandomView();

    List<HouseView> searchHouseByType(int houseType);

}
