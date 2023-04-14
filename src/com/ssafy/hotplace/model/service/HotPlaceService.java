package com.ssafy.hotplace.model.service;

import com.ssafy.hotplace.model.dto.HotPlaceDto;
import com.ssafy.util.PageNavigation;

import java.util.List;
import java.util.Map;

public interface HotPlaceService {
    void addHotPlace(HotPlaceDto hotPlaceDto) throws Exception;
    List<HotPlaceDto> getHotPlaceList(Map<String, String> map) throws Exception;
    PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
    HotPlaceDto getHotPlace(int hotPlaceId) throws Exception;
    void updateHit(int hotPlaceId) throws Exception;
    void modifyHotPlace(HotPlaceDto hotPlaceDto) throws Exception;
    void deleteHotPlace(int hotPlaceId) throws Exception;
}
