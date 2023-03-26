package com.ssafy.attraction.info.model.service;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;

import java.util.List;
import java.util.Map;

public interface AttractionInfoService {
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, String> param) throws Exception;
}
